//
//  EditorTests.swift
//  DocumentEditorTests
//
//  Created by User on 27.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import XCTest

class DocumentEditorTests: XCTestCase {
  
  func testSetTitle() {
    let expected = "Title: title\n"
    let data = ["set title", "list"]
    
    let stream = StandardStream(data: data)
    
    let editor = DocumentEditor(stream: stream)
    editor.start()
    
    XCTAssertEqual(expected, stream.out.allLogs)
  }
  
  func testUndoTitleSetting() {
    let expected = "Title: \n"
    let data = ["set title", "undo", "list"]
    
    let stream = StandardStream(data: data)
    
    let editor = DocumentEditor(stream: stream)
    editor.start()
    
    XCTAssertEqual(expected, stream.out.allLogs)
  }
  
  func testRedoTitleSetting() {
    let expected = "Title: title\n"
    let data = ["set title", "undo", "redo", "list"]
    
    let stream = StandardStream(data: data)
    
    let editor = DocumentEditor(stream: stream)
    editor.start()
    
    XCTAssertEqual(expected, stream.out.allLogs)
  }

  func testInsertMultipleParagraphs() {
    let expected = "Title: \n1. Paragraph: text1\n2. Paragraph: text2\n3. Paragraph: text3\n4. Paragraph: text4\n"
    let data = ["ip 1 text1", "ip 2 text2", "ip 3 text3", "ip end text4", "list"]
    
    let stream = StandardStream(data: data)
    
    let editor = DocumentEditor(stream: stream)
    editor.start()
    
    XCTAssertEqual(expected, stream.out.allLogs)
  }
  
  func testReplaceTextInParagraph() {
    let expected = "Title: \n1. Paragraph: text1\n2. Paragraph: text2\n3. Paragraph: text3\n4. Paragraph: replaced\n"
    let data = ["ip 1 text1", "ip 2 text2", "ip 3 text3", "ip end text4", "replace 4 replaced", "list"]
    
    let stream = StandardStream(data: data)
    
    let editor = DocumentEditor(stream: stream)
    editor.start()
    
    XCTAssertEqual(expected, stream.out.allLogs)
  }
  
  func testInsertMultipleImages() {
    let expected = "Title: \n1. Image: path \"Resources/Image.jpg\", resolution (100x100px)\n2. Image: path \"Resources/Image(1).jpg\", resolution (100x100px)\n"
    let data = ["ii 1 100 100 \(TestConstants.pathToImage) ", "ii end 100 100 \(TestConstants.pathToImage)", "list", "delete 1", "delete 1"]
    
    let stream = StandardStream(data: data)
    
    let editor = DocumentEditor(stream: stream)
    editor.start()
    
    XCTAssertEqual(expected, stream.out.allLogs)
    
    TestFunctions.deleteImage(filename: "Image.jpg")
    TestFunctions.deleteImage(filename: "Image(1).jpg")
  }
  
  func testResizeImage() {
    let expected = "Title: \n1. Image: path \"Resources/Image.jpg\", resolution (150x150px)\n"
    let data = ["ii 1 100 100 \(TestConstants.pathToImage)", "resize 1 150 150", "list", "delete 1"]
    
    let stream = StandardStream(data: data)
    
    let editor = DocumentEditor(stream: stream)
    editor.start()
    
    XCTAssertEqual(expected, stream.out.allLogs)
    
    TestFunctions.deleteImage(filename: "Image.jpg")
  }
  
  func testItemsList() {
    let expected = "Available commands:\n\tip: Insert Paragraph <position>|end <text>\n\tii: Insert Image <position>|end <width> <height> path\n\tset: Set title <title>\n\tlist: List of all available commands\n\treplace: Replace text <position> <text>\n\tresize: Resize image <position> <width> <height>\n\tdelete: Delete item <position>\n\thelp: Show help\n\tredo: Redo command\n\tundo: Undo command\n\tsave: Save to HTML <path>\n"
    
    let data = ["help"]
    let stream = StandardStream(data: data)
    
    let editor = DocumentEditor(stream: stream)
    editor.start()
    
    XCTAssertEqual(expected, stream.out.allLogs)
  }
  
  func testHelp() {
    let expected = "Available commands:\n\tip: Insert Paragraph <position>|end <text>\n\tii: Insert Image <position>|end <width> <height> path\n\tset: Set title <title>\n\tlist: List of all available commands\n\treplace: Replace text <position> <text>\n\tresize: Resize image <position> <width> <height>\n\tdelete: Delete item <position>\n\thelp: Show help\n\tredo: Redo command\n\tundo: Undo command\n\tsave: Save to HTML <path>\n"
    
    let data = ["help"]
    let stream = StandardStream(data: data)
    
    let editor = DocumentEditor(stream: stream)
    editor.start()
    
    XCTAssertEqual(expected, stream.out.allLogs)
  }
  
  func testSave() {
    let expected = "Title: \n1. Paragraph: text1\n2. Paragraph: text2\n3. Paragraph: text3\n4. Paragraph: replaced\n"
    let data = ["ip 1 text1", "ip 2 text2", "ip 3 text3", "ip end text4", "replace 4 replaced", "save Resources/index.html", "list"]
    
    let stream = StandardStream(data: data)
    
    let editor = DocumentEditor(stream: stream)
    editor.start()
    
    XCTAssertEqual(expected, stream.out.allLogs)
  }

}
