//
//  InsertItemCommandTests.swift
//  DocumentEditorTests
//
//  Created by User on 28.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import XCTest

class InsertItemCommandTests: XCTestCase {

  func testExecuteInsertDocumentItemParagraph() {
    let history = History()
    let paragraph = Paragraph(text: Text(value: "text"), history: history)
    
    let item = DocumentItem(paragraph: paragraph)
    let items: DocumentItemArrayProtocol = DocumentItemArray()
    
    let command = InsertItemCommand(item: item, items: items, position: 0)
    
    command.execute()
    
    XCTAssertEqual(1, items.value.count)
  }
  
  func testUnexecuteInsertDocumentItemParagraph() {
    let history = History()
    let paragraph = Paragraph(text: Text(value: "text"), history: history)
    
    let item = DocumentItem(paragraph: paragraph)
    let items: DocumentItemArrayProtocol = DocumentItemArray()
    
    let command = InsertItemCommand(item: item, items: items, position: 0)
    
    command.execute()
    command.unexecute()
    
    XCTAssertEqual(0, items.value.count)
  }
  
  func testExecuteInsertDocumentItemImage() {
    let history = History()
    
    let image = try? Image(path: TestConstants.pathToImage, width: 100, height: 100, history: history)
    
    let item = DocumentItem(image: image!)
    let items: DocumentItemArrayProtocol = DocumentItemArray()
    
    let command = InsertItemCommand(item: item, items: items, position: 0)
    
    command.execute()
    
    XCTAssertEqual(1, items.value.count)
    
    TestFunctions.deleteImage(filename: "Image.jpg")
  }
  
  func testUnexecuteInsertDocumentItemImage() {
    let history = History()
    
    let image = try? Image(path: TestConstants.pathToImage, width: 100, height: 100, history: history)
        
    let item = DocumentItem(image: image!)
    let items: DocumentItemArrayProtocol = DocumentItemArray()
    
    let command = InsertItemCommand(item: item, items: items, position: 0)
    
    command.execute()
    command.unexecute()
    
    XCTAssertEqual(0, items.value.count)
    
    TestFunctions.deleteImage(filename: "Image.jpg")
  }

}
