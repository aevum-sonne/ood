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

  func testInsertMultipleParagraphs() {
    let expected = "Title: \n1. Paragraph: text1\n2. Paragraph: text2\n3. Paragraph: text3\n4. Paragraph: text4\n"
    let data = ["ip 1 text1", "ip 2 text2", "ip 3 text3", "ip end text4", "list"]
    
    let stream = StandardStream(data: data)
    
    let editor = DocumentEditor(stream: stream)
    editor.start()
    
    XCTAssertEqual(expected, stream.out.allLogs)
  }
  
  func testInsertMultipleImages() {
    let pathToImage = #file.split(separator: "/").dropLast().joined(separator: "/") + "/Image.jpg"
    
    let expected = "Title: \n1. Image: path \"Resources/Image.jpg\", resolution (100x100px)\n2. Image: path \"Resources/Image(1).jpg\", resolution (100x100px)\n"
    let data = ["ii 1 100 100 \(pathToImage) ", "ii end 100 100 \(pathToImage)", "list", "delete 1", "delete 1"]
    
    let stream = StandardStream(data: data)
    
    let editor = DocumentEditor(stream: stream)
    editor.start()
    
    XCTAssertEqual(expected, stream.out.allLogs)
  }

}
