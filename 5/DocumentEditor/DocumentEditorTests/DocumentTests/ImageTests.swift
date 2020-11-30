//
//  ImageTests.swift
//  DocumentEditorTests
//
//  Created by User on 28.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import XCTest

class ImageTests: XCTestCase {
  
  func testConstructImageWithCorrectWidthAndHeightShouldNoThrow() {
    let width = 1000
    let height = 1000
    
    let history = History()
    
    XCTAssertNoThrow(try Image(path: TestConstants.pathToImage, width: width, height: height, history: history))
    
    TestFunctions.deleteImage(filename: "Image.jpg")
  }
  
  func testConstructImageWithIncorrectWidthAndHeightShouldThrow() {
    let width = 10000
    let height = 0
    
    let history = History()
    
    XCTAssertThrowsError(try Image(path: TestConstants.pathToImage, width: width, height: height, history: history))
    
    TestFunctions.deleteImage(filename: "Image.jpg")
  }

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
