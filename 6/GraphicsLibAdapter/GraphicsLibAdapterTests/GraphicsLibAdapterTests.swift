//
//  GraphicsLibAdapterTests.swift
//  GraphicsLibAdapterTests
//
//  Created by User on 27.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

@testable import class App.GraphicsLibAdapter
@testable import class ModernGraphicsLib.ModernGraphicsRenderer

import XCTest
import TextStream

class GraphicsLibAdapterTests: XCTestCase {
  
  func testCreateAdapterWhenRendererIsNotDrawing() {
    let stream = TextStream.OStream(type: .logs)
    let renderer = ModernGraphicsRenderer(outStream: stream)
    
    XCTAssertNoThrow(try GraphicsLibAdapter(renderer: renderer))
  }
  
  func testCreateAdapterWhenRendererIsAlreadyDrawingShouldThrow() {
    let stream = TextStream.OStream(type: .logs)
    let renderer = ModernGraphicsRenderer(outStream: stream)
    try! renderer.beginDraw()
    
    XCTAssertThrowsError(try GraphicsLibAdapter(renderer: renderer))
  }
  
  func testAdapterDesctructorShouldCallEndDraw() {
    let expectedOut = "<draw>\n</draw>\n"
    
    let stream = TextStream.OStream(type: .logs)
    var renderer: ModernGraphicsRenderer? = ModernGraphicsRenderer(outStream: stream)
    
    try! renderer?.beginDraw()
    renderer = nil
    
    XCTAssertEqual(expectedOut, stream.logs)
  }
  
  func testDrawLineWhenNotDrawing() {
    let expectedOut = "<draw>\n</draw>\n"
    
    let stream = TextStream.OStream(type: .logs)
    let renderer: ModernGraphicsRenderer? = ModernGraphicsRenderer(outStream: stream)
    
    let adapter: GraphicsLibAdapter = try! GraphicsLibAdapter(renderer: renderer!)
    
    try? renderer?.beginDraw()
    try? renderer?.endDraw()
    
    adapter.moveTo(x: 1, y: 10)
    adapter.lineTo(x: 2, y: 20)
    
    XCTAssertEqual(expectedOut, stream.logs)
  }
  
  func testCorrectLineToAdapterBehavior() {
    let expectedOut = "<draw>\n\t<line fromX=1 fromY=10 toX=2 toY=20 />\n\t<line fromX=2 fromY=20 toX=5 toY=50 />\n</draw>\n"
    
    let stream = TextStream.OStream(type: .logs)
    let renderer = ModernGraphicsRenderer(outStream: stream)
    
    var adapter: GraphicsLibAdapter? = try! GraphicsLibAdapter(renderer: renderer)
    
    adapter?.moveTo(x: 1, y: 10)
    adapter?.lineTo(x: 2, y: 20)
    
    adapter?.moveTo(x: 2, y: 20)
    adapter?.lineTo(x: 5, y: 50)
  
    adapter = nil
    
    XCTAssertEqual(expectedOut, stream.logs)
  }

  
}
