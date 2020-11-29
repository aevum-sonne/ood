//
//  DeleteItemCommandTests.swift
//  DocumentEditorTests
//
//  Created by User on 28.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import XCTest

class DeleteItemCommandTests: XCTestCase {

  func testExecuteDeleteItemParagraph() {
    let history = History()
    let paragraph = Paragraph(text: Text(value: "text"), history: history)
    
    let item = DocumentItem(paragraph: paragraph)
    let items = DocumentItemArray()
    
    items.value.append(item)
    items.value.append(item)
    
    let command = DeleteItemCommand(items: items, position: 0)
    
    command.execute()
    
    XCTAssertEqual(1, items.value.count)
  }
  
  func testUnexecuteDeleteItemParagraph() {
    let history = History()
    let paragraph = Paragraph(text: Text(value: "text"), history: history)
    
    let item = DocumentItem(paragraph: paragraph)
    let items = DocumentItemArray()
    
    items.value.append(item)
    items.value.append(item)
    
    let command = DeleteItemCommand(items: items, position: 0)
    
    command.execute()
    command.execute()
    
    XCTAssertEqual(0, items.value.count)
    
    command.unexecute()
    command.unexecute()
    
    XCTAssertEqual(2, items.value.count)
  }
  
  func testExecuteDeleteItemImage() {
    let history = History()
    let width = 150
    let height = 150
    
    let image = try? Image(path: TestConstants.pathToImage, width: width, height: height, history: history)
    
    let item = DocumentItem(image: image!)
    let items = DocumentItemArray()
    
    items.value.append(item)
    items.value.append(item)
    
    let command = DeleteItemCommand(items: items, position: 0)
    
    command.execute()
    
    XCTAssertEqual(1, items.value.count)
    
    TestFunctions.deleteImage(filename: "Image.jpg")
  }
  
  func testUnexecuteDeleteItemImage() {
    let history = History()
    let width = 150
    let height = 150
    
    let image = try? Image(path: TestConstants.pathToImage, width: width, height: height, history: history)
    
    let item = DocumentItem(image: image!)
    let items = DocumentItemArray()
    
    items.value.append(item)
    items.value.append(item)
    
    let command = DeleteItemCommand(items: items, position: 0)
    
    command.execute()
    command.execute()
    
    XCTAssertEqual(0, items.value.count)
    
    command.unexecute()
    command.unexecute()
    
    XCTAssertEqual(2, items.value.count)
    
    TestFunctions.deleteImage(filename: "Image.jpg")
  }

}
