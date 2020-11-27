//
//  GraphicsLibAdapterProTests.swift
//  GraphicsLibAdapterTests
//
//  Created by User on 27.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

@testable import StandardStream

@testable import class App.GraphicsLibAdapterPro
@testable import class ModernGraphicsLibPro.ModernGraphicsRendererPro

import XCTest

class GraphicsLibAdapterProTests: XCTestCase {
  
  func testCreateAdapterWhenRendererIsNotDrawing() {
    let stream = StandardStream(outType: .log)
    let renderer = ModernGraphicsRendererPro(stream: stream)
    
    XCTAssertNoThrow(try GraphicsLibAdapterPro(renderer: renderer))
  }
  
  func testCreateAdapterWhenRendererIsAlreadyDrawingShouldThrow() {
    let stream = StandardStream(outType: .log)
    let renderer = ModernGraphicsRendererPro(stream: stream)
    try! renderer.beginDraw()
    
    XCTAssertThrowsError(try GraphicsLibAdapterPro(renderer: renderer))
  }
  
  func testAdapterDesctructorShouldCallEndDraw() {
    let expectedOut = "<draw>\n</draw>\n"
    
    let stream = StandardStream(outType: .log)
    var renderer: ModernGraphicsRendererPro? = ModernGraphicsRendererPro(stream: stream)
    
    try! renderer?.beginDraw()
    renderer = nil
    
    XCTAssertEqual(expectedOut, stream.out.allLogs!)
  }
  
  func testDrawLineWhenNotDrawing() {
    let expectedOut = "<draw>\n</draw>\n"
    
    let stream = StandardStream(outType: .log)
    let renderer: ModernGraphicsRendererPro? = ModernGraphicsRendererPro(stream: stream)
    
    let adapter: GraphicsLibAdapterPro = try! GraphicsLibAdapterPro(renderer: renderer!)
    
    try? renderer?.beginDraw()
    try? renderer?.endDraw()
    
    adapter.moveTo(x: 1, y: 10)
    adapter.setColor(color: 0xFFFFFF)
    adapter.lineTo(x: 2, y: 20)
    
    XCTAssertEqual(expectedOut, stream.out.allLogs)
  }
  
  func testCorrectLineToAdapterBehavior() {
    let expectedOut = "<draw>\n\t<line fromX=1 fromY=10 toX=2 toY=20>\n\t\t<color r=0.0 g=0.0 b=0.0 a=1.0>\n\t</line>\n\t<line fromX=2 fromY=20 toX=5 toY=50>\n\t\t<color r=0.7529411764705882 g=0.7529411764705882 b=0.7529411764705882 a=1.0>\n\t</line>\n"
    
    let stream = StandardStream(outType: .log)
    let renderer = ModernGraphicsRendererPro(stream: stream)
    
    var adapter: GraphicsLibAdapterPro? = try! GraphicsLibAdapterPro(renderer: renderer)
    
    adapter?.moveTo(x: 1, y: 10)
    adapter?.lineTo(x: 2, y: 20)
    
    adapter?.setColor(color: 0xC0C0C0)
    
    adapter?.moveTo(x: 2, y: 20)
    adapter?.lineTo(x: 5, y: 50)
  
    adapter = nil
    
    XCTAssertEqual(expectedOut, stream.out.allLogs!)
  }
  
  
}
