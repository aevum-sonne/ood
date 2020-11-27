//
//  MenuTests.swift
//  DocumentEditorTests
//
//  Created by User on 27.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

@testable import DocumentEditor

import XCTest

class MenuTests: XCTestCase {
  
  func testEmptyStringMenuInput() {
    let expected = "Invalid command. Invalid arguments count.\n"
    
    let data = [""]
    let stream = StandardStream(data: data)
        
    let menu = Menu(stream: stream)
    
    menu.run()
    
    XCTAssertEqual(expected, stream.out.allLogs!)
  }
  
  func testCreateMenuWithMultipleCommands() {
    let expected = "Mock command1 executed\nMock command2 executed\nMock command3 executed\n"
    
    let data = ["shortcut1", "shortcut2", "shortcut3"]
    let stream = StandardStream(data: data)
        
    let menu = Menu(stream: stream)
    menu.addItem(shortcut: "shortcut1", description: "description", command: { (args: [String]) -> Void in print("Mock command1 executed", to: &stream.out) })
    menu.addItem(shortcut: "shortcut2", description: "description", command: { (args: [String]) -> Void in print("Mock command2 executed", to: &stream.out) })
    menu.addItem(shortcut: "shortcut3", description: "description", command: { (args: [String]) -> Void in print("Mock command3 executed", to: &stream.out) })
    
    menu.run()
    
    XCTAssertEqual(expected, stream.out.allLogs!)
  }
  
  func testMenuHelp() {
    let expected = "Available commands:\n\tshortcut1: description\n\tshortcut2: description\n\tshortcut3: description\n"
    
    let data = ["shortcut1", "shortcut2", "shortcut3"]
    let stream = StandardStream(data: data)
        
    let menu = Menu(stream: stream)
    menu.addItem(shortcut: "shortcut1", description: "description", command: { (args: [String]) -> Void in print("Mock command1 executed", to: &stream.out) })
    menu.addItem(shortcut: "shortcut2", description: "description", command: { (args: [String]) -> Void in print("Mock command2 executed", to: &stream.out) })
    menu.addItem(shortcut: "shortcut3", description: "description", command: { (args: [String]) -> Void in print("Mock command3 executed", to: &stream.out) })
    
    menu.help()
    
    XCTAssertEqual(expected, stream.out.allLogs!)
  }
  
  func testInputUnknownCommandMenu() {
    let expected = "Invalid command. Unknown command.\n"
    
    let data = ["unknown"]
    let stream = StandardStream(data: data)
        
    let menu = Menu(stream: stream)
    menu.addItem(shortcut: "shortcut", description: "description", command: { (args: [String]) -> Void in print("Mock command executed", to: &stream.out) })
    
    menu.run()
    
    XCTAssertEqual(expected, stream.out.allLogs!)
  }
  
}
