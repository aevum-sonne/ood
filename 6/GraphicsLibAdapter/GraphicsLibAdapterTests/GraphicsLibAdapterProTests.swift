//
//  GraphicsLibAdapterProTests.swift
//  GraphicsLibAdapterTests
//
//  Created by User on 27.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

@testable import class App.GraphicsLibAdapterPro
@testable import class ModernGraphicsLibPro.ModernGraphicsRendererPro

import XCTest
import TextStream

class GraphicsLibAdapterProTests: XCTestCase {
  
  func testCreateAdapterWhenRendererIsNotDrawing() {
    let stream = TextStream.OStream(type: .logs)
    let renderer = ModernGraphicsRendererPro(outStream: stream)
    
    XCTAssertNoThrow(try GraphicsLibAdapterPro(renderer: renderer))
  }
  
  func testCreateAdapterWhenRendererIsAlreadyDrawingShouldThrow() {
    let stream = TextStream.OStream(type: .logs)
    let renderer = ModernGraphicsRendererPro(outStream: stream)
    try! renderer.beginDraw()
    
    XCTAssertThrowsError(try GraphicsLibAdapterPro(renderer: renderer))
  }
  
  func testAdapterDesctructorShouldCallEndDraw() {
    let expectedOut = "<draw>\n</draw>\n"
    
    let stream = TextStream.OStream(type: .logs)
    var renderer: ModernGraphicsRendererPro? = ModernGraphicsRendererPro(outStream: stream)
    
    try! renderer?.beginDraw()
    renderer = nil
    
    XCTAssertEqual(expectedOut, stream.logs)
  }
  
  func testDrawLineWhenNotDrawing() {
    let expectedOut = "<draw>\n</draw>\n"
    
    let stream = TextStream.OStream(type: .logs)
    let renderer: ModernGraphicsRendererPro? = ModernGraphicsRendererPro(outStream: stream)
    
    let adapter: GraphicsLibAdapterPro = try! GraphicsLibAdapterPro(renderer: renderer!)
    
    try? renderer?.beginDraw()
    try? renderer?.endDraw()
    
    adapter.moveTo(x: 1, y: 10)
    adapter.setColor(color: 0xFFFFFF)
    adapter.lineTo(x: 2, y: 20)
    
    XCTAssertEqual(expectedOut, stream.logs)
  }
  
  func testCorrectLineToAdapterBehavior() {
    let expectedOut = "<draw>\n\t<line fromX=1 fromY=10 toX=2 toY=20>\n\t\t<color r=0.0 g=0.0 b=0.0 a=1.0>\n\t</line>\n\t<line fromX=2 fromY=20 toX=5 toY=50>\n\t\t<color r=0.7529411764705882 g=0.7529411764705882 b=0.7529411764705882 a=1.0>\n\t</line>\n"
    
    let stream = TextStream.OStream(type: .logs)
    let renderer = ModernGraphicsRendererPro(outStream: stream)
    
    var adapter: GraphicsLibAdapterPro? = try! GraphicsLibAdapterPro(renderer: renderer)
    
    adapter?.moveTo(x: 1, y: 10)
    adapter?.lineTo(x: 2, y: 20)
    
    adapter?.setColor(color: 0xC0C0C0)
    
    adapter?.moveTo(x: 2, y: 20)
    adapter?.lineTo(x: 5, y: 50)
  
    adapter = nil
    
    XCTAssertEqual(expectedOut, stream.logs)
  }
  
  
}
