//
//  DocumentTests.swift
//  DocumentEditorTests
//
//  Created by User on 27.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import XCTest

class DocumentTests: XCTestCase {
  
  func testDocumentCountEmptyDocument() {
    let document = Document()
    
    XCTAssertEqual(0, document.count)
  }
  
  func testDocumentCountNonEmptyDocument() {
    let document = Document()
    
    XCTAssertNoThrow(try document.insertParagraph(position: 1, text: "1"))
    XCTAssertNoThrow(try document.insertParagraph(position: 2, text: "2"))
    XCTAssertNoThrow(try document.insertParagraph(position: 3, text: "3"))
    XCTAssertNoThrow(try document.insertParagraph(position: 4, text: "4"))
    
    XCTAssertEqual(4, document.count)
  }

  func testDocumentSetTitle() {
    let expected = "title"
    let document = Document()
    
    document.setTitle(title: "title")
    
    XCTAssertEqual(expected, document.title)
  }
  
  func testDocumentInsertParagraph() {
    let document = Document()
    
    XCTAssertNoThrow(try document.insertParagraph(position: 1, text: "1"))
    XCTAssertNoThrow(try document.insertParagraph(position: 2, text: "2"))
    XCTAssertNoThrow(try document.insertParagraph(position: 3, text: "3"))
    XCTAssertNoThrow(try document.insertParagraph(position: 4, text: "4"))
    
    XCTAssertEqual("1", document.getItem(index: 0)?.paragraph?.value)
    XCTAssertEqual("2", document.getItem(index: 1)?.paragraph?.value)
    XCTAssertEqual("3", document.getItem(index: 2)?.paragraph?.value)
    XCTAssertEqual("4", document.getItem(index: 3)?.paragraph?.value)
  }
  
  func testCanUndo() {
    let document = Document()
    
    XCTAssertNoThrow(try document.insertParagraph(position: 1, text: "1"))
    XCTAssertNoThrow(try document.insertParagraph(position: 2, text: "2"))
    XCTAssertNoThrow(try document.insertParagraph(position: 3, text: "3"))
    XCTAssertNoThrow(try document.insertParagraph(position: 4, text: "4"))
    
    XCTAssertTrue(document.canUndo())
  }
  
  func testCanRedo() {
    let document = Document()
    
    XCTAssertNoThrow(try document.insertParagraph(position: 1, text: "1"))
    XCTAssertNoThrow(try document.insertParagraph(position: 2, text: "2"))
    XCTAssertNoThrow(try document.insertParagraph(position: 3, text: "3"))
    XCTAssertNoThrow(try document.insertParagraph(position: 4, text: "4"))
    
    XCTAssertNoThrow(try document.undo())
    
    XCTAssertTrue(document.canRedo())
  }
  
  func testSaveDocument() {
    let expected = "<!DOCTYPE html>\n<html>\n    <head>\n        <title>  </title>\n    <head>\n    <body>\n            <p> 1 </p>\n            <p> 2 </p>\n            <p> 3 </p>\n            <p> 4 </p>\n    <body>\n<html>\n"
    
    let document = Document()
    
    XCTAssertNoThrow(try document.insertParagraph(position: 1, text: "1"))
    XCTAssertNoThrow(try document.insertParagraph(position: 2, text: "2"))
    XCTAssertNoThrow(try document.insertParagraph(position: 3, text: "3"))
    XCTAssertNoThrow(try document.insertParagraph(position: 4, text: "4"))
    
    let pathTestDir = #file.split(separator: "/").dropLast().joined(separator: "/")
    let pathIndexHtml =  pathTestDir + "/index.html"
        
    document.save(path: pathIndexHtml)
    
    let url = URL(string: Constants.filePrefix + pathIndexHtml)
    let htmlContent = try! String(contentsOf: url!)
        
    XCTAssertEqual(expected, htmlContent)
    
    try! FileManager.default.removeItem(at: url!)
  }
}
