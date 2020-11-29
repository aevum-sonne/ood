//
//  ImageTests.swift
//  DocumentEditorTests
//
//  Created by User on 28.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import XCTest

class ImageTests: XCTestCase {

  func testExecuteImageResizing() {
    let width = 150
    let height = 150
    
    let expectedWidth = 300
    let expectedHeight = 300
    
    let history = History()
    
    let image = try? Image(path: TestConstants.pathToImage, width: width, height: height, history: history)
    
    try? image?.resize(width: expectedWidth, height: expectedHeight)
    
    XCTAssertEqual(expectedWidth, image?.width)
    XCTAssertEqual(expectedHeight, image?.height)
    
    TestFunctions.deleteImage(filename: "Image.jpg")
  }
  
  func testUnexecuteImageResizing() {
    let width = 150
    let height = 150
    
    let expectedWidth = 300
    let expectedHeight = 300
    
    let history = History()
    
    let image = try? Image(path: TestConstants.pathToImage, width: width, height: height, history: history)
    
    try? image?.resize(width: expectedWidth, height: expectedHeight)
    
    XCTAssertEqual(expectedWidth, image?.width)
    XCTAssertEqual(expectedHeight, image?.height)
    
    try? history.undo()
    
    XCTAssertEqual(150, image?.width)
    XCTAssertEqual(150, image?.height)
    
    TestFunctions.deleteImage(filename: "Image.jpg")
  }

}
