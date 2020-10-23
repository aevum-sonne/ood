//
//  ShapesDrawTests.swift
//  DesignersFactoryTests
//
//  Created by User on 16.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

@testable import DesignersFactory

import XCTest

class PainterTests: XCTestCase {
  var canvas: CanvasProtocol = Canvas()
  
  func testDrawRectangle() {
    let expected = "Set black color\nDraw line from: (30.0, 30.0) to (430.0, 30.0)\nDraw line from: (430.0, 30.0) to (430.0, -370.0)\nDraw line from: (430.0, -370.0) to (30.0, -370.0)\nDraw line from: (30.0, -370.0) to (30.0, 30.0)\n"
    let rectangle = Rectangle(color: .black, leftTop: CGPoint(x: 30, y: 30), width: 400, height: 400)
    
    let log = Log()
    let canvas = MockCanvas(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000), log: log)
    
    let draft = PictureDraft()
    draft.addShape(shape: rectangle)
    
    let painter = Painter()
    painter.drawPicture(canvas: canvas, draft: draft)
    
    XCTAssertEqual(expected, log.value)
  }
  
  func testDrawTriangle() {
    let expected = "Set pink color\nDraw line from: (430.0, 330.0) to (360.0, 466.0)\nDraw line from: (360.0, 466.0) to (660.0, 330.0)\nDraw line from: (660.0, 330.0) to (430.0, 330.0)\n"
    let triangle = Triangle(color: .systemPink, vertex1: CGPoint(x: 430, y: 330), vertex2: CGPoint(x: 360, y: 466), vertex3: CGPoint(x: 660, y: 330))
    
    let log = Log()
    let canvas = MockCanvas(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000), log: log)
    
    let draft = PictureDraft()
    draft.addShape(shape: triangle)
    
    let painter = Painter()
    painter.drawPicture(canvas: canvas, draft: draft)
        
    XCTAssertEqual(expected, log.value)
  }
  
  func testDrawPolygon() {
    let expected = "Set yellow color\nDraw line from: (800.0, 500.0) to (712.1320343559643, 712.1320343559643)\nDraw line from: (712.1320343559643, 712.1320343559643) to (500.0, 800.0)\nDraw line from: (500.0, 800.0) to (287.86796564403573, 712.1320343559643)\nDraw line from: (287.86796564403573, 712.1320343559643) to (200.0, 500.00000000000006)\nDraw line from: (200.0, 500.00000000000006) to (287.86796564403573, 287.86796564403573)\nDraw line from: (287.86796564403573, 287.86796564403573) to (499.99999999999994, 200.0)\nDraw line from: (499.99999999999994, 200.0) to (712.1320343559643, 287.86796564403573)\nDraw line from: (712.1320343559643, 287.86796564403573) to (800.0, 499.99999999999994)\n"
    let polygon = RegularPolygon(color: .yellow, center: CGPoint(x: 500, y: 500), radius: 300, vertexCount: 8)
    
    let log = Log()
    let canvas = MockCanvas(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000), log: log)
    
    let draft = PictureDraft()
    draft.addShape(shape: polygon)
    
    let painter = Painter()
    painter.drawPicture(canvas: canvas, draft: draft)
    
    XCTAssertEqual(expected, log.value)
  }
  
  func testDrawEllipse() {
    let expected = "Set black color\nDraw ellipse with center (400.0, 400.0), horizontal radius: 500.0, verticalRadius: 300.0\n"
    let ellipse = Ellipse(color: .black, center: CGPoint(x: 400, y: 400), horizontalRadius: 500, verticalRadius: 300)
    
    let log = Log()
    let canvas = MockCanvas(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000), log: log)
    
    let draft = PictureDraft()
    draft.addShape(shape: ellipse)
    
    let painter = Painter()
    painter.drawPicture(canvas: canvas, draft: draft)
    
    XCTAssertEqual(expected, log.value)
  }
}


class Log {
  var value: String = ""
}

class MockCanvas: CanvasProtocol {
  var color: NSColor = .black

  var log: Log

  init(frame: CGRect, log: Log) {
    self.log = log
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setColor(color: NSColor) {
    var logColor: String = ""
    switch (color) {
      case .black:
        logColor = "black"
      case .systemPink:
        logColor = "pink"
      case .green:
        logColor = "green"
      case .yellow:
        logColor = "yellow"
      case .red:
        logColor = "red"
      case .blue:
        logColor = "blue"
      default:
        logColor = "undefined"
    }
    
    log.value += "Set \(logColor) color\n"
  }

  func drawLine(from: CGPoint, to: CGPoint) {
    log.value += "Draw line from: \(from) to \(to)\n"
  }

  func drawEllipse(center: CGPoint, horizontalRadius: CGFloat, verticalRadius: CGFloat) {
    log.value += "Draw ellipse with center \(center), horizontal radius: \(horizontalRadius), verticalRadius: \(verticalRadius)\n"
  }
}
