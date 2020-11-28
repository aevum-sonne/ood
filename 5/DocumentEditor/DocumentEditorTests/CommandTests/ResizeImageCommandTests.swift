//
//  ResizeImageCommandTests.swift
//  DocumentEditorTests
//
//  Created by User on 28.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import XCTest

class ResizeImageCommandTests: XCTestCase {
  
  func testExecuteResizeImage() {
    let expectedW = 300
    let expectedH = 300
    
    let width = 150
    let height = 150
    
    let history = History()
    
    let image = try? Image(path: TestConstants.pathToImage, width: width, height: height, history: history)
        
    try? image?.resize(width: expectedW, height: expectedH)

    XCTAssertEqual(expectedW, image?.width)
    XCTAssertEqual(expectedH, image?.height)
    
    TestFunctions.deleteImage(filename: "Image.jpg")
  }
  
  func testUnexecuteResizeImage() {
    let expectedW = 300
    let expectedH = 300
    
    let width = 150
    let height = 150
    
    let history = History()
    
    let image = try? Image(path: TestConstants.pathToImage, width: width, height: height, history: history)
        
    try? image?.resize(width: expectedW, height: expectedH)
    try? history.undo()
    
    XCTAssertEqual(width, image?.width)
    XCTAssertEqual(height, image?.height)
    
    TestFunctions.deleteImage(filename: "Image.jpg")
  }
  
  func testResizeInImageConstructorWithOutOfAcceptableRangeResolution() {
    let width = 123
    let height = -42545
    
    let history = History()
    
    XCTAssertThrowsError(try Image(path: TestConstants.pathToImage, width: width, height: height, history: history))
            
    TestFunctions.deleteImage(filename: "Image.jpg")
  }
  
  func testResizeOutOfAcceptableRangeResolution() {
    let expectedW = 10000
    let expectedH = 0
    
    let width = 150
    let height = 150
    
    let history = History()
    
    let image = try? Image(path: TestConstants.pathToImage, width: width, height: height, history: history)
        
    XCTAssertThrowsError(try image?.resize(width: expectedW, height: expectedH))
    
    TestFunctions.deleteImage(filename: "Image.jpg")
  }
  
}
