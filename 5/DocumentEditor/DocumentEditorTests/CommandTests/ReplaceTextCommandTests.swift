//
//  ReplaceTextCommandTests.swift
//  DocumentEditorTests
//
//  Created by User on 28.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import XCTest

class ReplaceTextCommandTests: XCTestCase {
  
  func testExecuteTitleTextReplacement() {
    let expected = "new text"
    let testText = Text(value: expected)
    
    let title = Text(value: "text")
    
    let command = ReplaceTextCommand(text: title, newText: testText)
    
    command.execute()
    
    XCTAssertEqual(expected, title.value)
  }
  
  func testUnexecuteTitleTextReplacement() {
    let expected = "text"
    let testText = Text(value: "new text")
    
    let title = Text(value: "text")
    
    let command = ReplaceTextCommand(text: title, newText: testText)
    
    command.execute()
    command.unexecute()
    
    XCTAssertEqual(expected, title.value)
  }

}
