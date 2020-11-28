//
//  ParagraphTests.swift
//  DocumentEditorTests
//
//  Created by User on 28.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import XCTest

class ParagraphTests: XCTestCase {
  
  func testGetNotEmptyParagraphValue() {
    let expected = "text1"
    
    let history = History()

    let paragraph = Paragraph(text: Text(value: "text1"), history: history)
    
    XCTAssertNotEqual("", paragraph.value)
    XCTAssertEqual(expected, paragraph.value)
  }
  
  func testParagraphNewTextSettingWithCorrectSavingInHistory() {
    let expectedText1 = "text1"
    let expectedText2 = "text2"
    
    let history = History()
    
    let paragraph = Paragraph(text: Text(value: "text1"), history: history)
    
    paragraph.setText(value: "text2")
    
    XCTAssertEqual(expectedText2, paragraph.value)
    
    try? history.undo()
    
    XCTAssertEqual(expectedText1, paragraph.value)
    
    try? history.redo()
    
    XCTAssertEqual(expectedText2, paragraph.value)
  }

}
