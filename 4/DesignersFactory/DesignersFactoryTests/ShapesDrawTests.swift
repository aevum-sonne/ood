//
//  ShapesDrawTests.swift
//  DesignersFactoryTests
//
//  Created by User on 16.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

@testable import DesignersFactory

import XCTest

class ShapesDrawTests: XCTestCase {

  let frame = CGRect(x: 0, y: 0, width: 1000, height: 1000)
  
  func testDrawRectangle() {
    let rectangle = Rectangle(frame: frame, color: .black, leftTop: CGPoint(x: 66, y: 66), width: 133, height: 133)
    let view = NSView()
    
    XCTAssertEqual(rectangle, getDrownShapeFromPainting(painting: view, shape: rectangle))
  }
  
  func testDrawTriangle() {
    let triangle = Triangle(frame: frame, color: .green, vertex1: CGPoint(x: 0, y: 0), vertex2: CGPoint(x: 66, y: 66), vertex3: CGPoint(x: 122, y: 0))
    let view = NSView()
    
    XCTAssertEqual(triangle, getDrownShapeFromPainting(painting: view, shape: triangle))
  }
  
  func testDrawRegularPolygon() {
    let polygon = RegularPolygon(frame: frame, color: .systemPink, center: CGPoint(x: 85, y: 226), radius: 70, vertexCount: 12)
    let view = NSView()
    
    XCTAssertEqual(polygon, getDrownShapeFromPainting(painting: view, shape: polygon))
  }
  
  func testDrawEllipse() {
    let polygon = Ellipse(frame: frame, color: .green, center: CGPoint(x: 85, y: 226), horizontalRadius: 33, verticalRadius: 56)
    let view = NSView()
    
    XCTAssertEqual(polygon, getDrownShapeFromPainting(painting: view, shape: polygon))
  }

  private func getDrownShapeFromPainting(painting: NSView, shape: ShapeProtocol) -> NSView {
    let draft = PictureDraft()
    draft.addShape(shape: shape)
    
    let painter = Painter()
    painter.drawPicture(view: painting, draft: draft)
    
    return painting.subviews.first!
  }
}
