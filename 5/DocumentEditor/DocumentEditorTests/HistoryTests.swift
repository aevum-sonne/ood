//
//  HistoryTests.swift
//  DocumentEditorTests
//
//  Created by User on 27.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import XCTest

fileprivate class MockCommand: CommandProtocol {
  func execute() {}
  func unexecute() {}
}

class HistoryTests: XCTestCase {

  func testRedoEmptyHistory() {
    let history = History()
    
    XCTAssertThrowsError(try history.redo())
  }
  
  func testUndoEmptyHistory() {
    let history = History()
    
    XCTAssertThrowsError(try history.undo())
  }
  
  func testUndoNonEmptyHistory() {
    let history = History()
    let command = MockCommand()
    
    history.saveAndExecuteCommand(command: command)
            
    XCTAssertNoThrow(try history.undo())
  }
  
  func testRedoNonEmptyHistory() {
    let history = History()
    let command = MockCommand()
    
    history.saveAndExecuteCommand(command: command)
    try? history.undo()
            
    XCTAssertNoThrow(try history.redo())
  }
  
  func testMultipleRedoUndoCommands() {
    let history = History()
    let command1 = MockCommand()
    let command2 = MockCommand()
    let command3 = MockCommand()
    let command4 = MockCommand()
    
    history.saveAndExecuteCommand(command: command1)
    history.saveAndExecuteCommand(command: command2)
    history.saveAndExecuteCommand(command: command3)
    history.saveAndExecuteCommand(command: command4)
    
    XCTAssertNoThrow(try history.undo())
    XCTAssertNoThrow(try history.undo())
    XCTAssertNoThrow(try history.undo())
    XCTAssertNoThrow(try history.undo())
            
    XCTAssertNoThrow(try history.redo())
    XCTAssertNoThrow(try history.redo())
    XCTAssertNoThrow(try history.redo())
    XCTAssertNoThrow(try history.redo())
    
    XCTAssertNoThrow(try history.undo())
    XCTAssertNoThrow(try history.undo())
    
    XCTAssertNoThrow(try history.redo())
  }
  
  func testMaxHistoryCapacityCommandCount() {
    let history = History()
    let command = MockCommand()
    
    for _ in 0...10 {
      history.saveAndExecuteCommand(command: command)
    }
    
    for _ in 0...10 {
      XCTAssertNoThrow(try history.undo())
    }
    
    for _ in 0...10 {
      XCTAssertNoThrow(try history.redo())
    }
  }
  
  func testOutOfMaxHistoryCapacityCommandCount() {
    let history = History()
    let command = MockCommand()
    
    for _ in 0...10 {
      history.saveAndExecuteCommand(command: command)
    }
    
    for _ in 0...10 {
      XCTAssertNoThrow(try history.undo())
    }
    
    for _ in 0...10 {
      XCTAssertNoThrow(try history.redo())
    }
    
    XCTAssertThrowsError(try history.redo())
    
    for _ in 0...10 {
      XCTAssertNoThrow(try history.undo())
    }
    
    XCTAssertThrowsError(try history.undo())
  }
  
}
