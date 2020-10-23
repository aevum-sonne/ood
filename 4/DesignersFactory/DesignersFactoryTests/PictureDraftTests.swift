//
//  PictureDraftTests.swift
//  DesignersFactoryTests
//
//  Created by User on 16.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

@testable import DesignersFactory

import XCTest

class PictureDraftTests: XCTestCase {

  func testShapesCountInDraft() {
    let rectangle = Rectangle(color: .black, leftTop: CGPoint(x: 66, y: 66), width: 133, height: 133)
    let triangle = Triangle(color: .systemPink, vertex1: CGPoint(x: 430, y: 330), vertex2: CGPoint(x: 360, y: 466), vertex3: CGPoint(x: 660, y: 330))
    let polygon = RegularPolygon(color: .yellow, center: CGPoint(x: 500, y: 500), radius: 300, vertexCount: 8)
    let ellipse = Ellipse(color: .red, center: CGPoint(x: 400, y: 400), horizontalRadius: 500, verticalRadius: 300)

    
    let draft = PictureDraft()
    draft.addShape(shape: rectangle)
    draft.addShape(shape: triangle)
    draft.addShape(shape: polygon)
    draft.addShape(shape: ellipse)

    let expectedCount = 4
    
    XCTAssertEqual(expectedCount, draft.shapes.count)
  }
  
  func testGetShapesFromDraft() {
    let expectedRectangle = Rectangle(color: .black, leftTop: CGPoint(x: 66, y: 66), width: 133, height: 133)
    let expectedTriangle = Triangle(color: .systemPink, vertex1: CGPoint(x: 430, y: 330), vertex2: CGPoint(x: 360, y: 466), vertex3: CGPoint(x: 660, y: 330))
    let expectedPolygon = RegularPolygon(color: .yellow, center: CGPoint(x: 500, y: 500), radius: 300, vertexCount: 8)
    let expectedEllipse = Ellipse(color: .red, center: CGPoint(x: 400, y: 400), horizontalRadius: 500, verticalRadius: 300)

    
    let draft = PictureDraft()
    draft.addShape(shape: expectedRectangle)
    draft.addShape(shape: expectedTriangle)
    draft.addShape(shape: expectedPolygon)
    draft.addShape(shape: expectedEllipse)
    
    XCTAssertEqual(expectedRectangle, draft.shapes[0] as! Rectangle)
    XCTAssertEqual(expectedTriangle, draft.shapes[1] as! Triangle)
    XCTAssertEqual(expectedPolygon, draft.shapes[2] as! RegularPolygon)
    XCTAssertEqual(expectedEllipse, draft.shapes[3] as! Ellipse)
  }

}
