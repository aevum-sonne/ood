//
//  DesignerTests.swift
//  DesignersFactoryTests
//
//  Created by User on 16.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

@testable import DesignersFactory

import XCTest

class DesignerTests: XCTestCase {

  let frame = CGRect(x: 0, y: 0, width: 1000, height: 1000)

  func testOneTypeCorrectShapes() {
    let tasks = ["rectangle black 30 30 400 400",
                 "rectangle yellow 2 22 21 32",
                 "rectangle green 15 31 29 43"]
    
    let expectedRectangle1 = Rectangle(color: .black, leftTop: CGPoint(x: 30, y: 30), width: 400, height: 400)
    let expectedRectangle2 = Rectangle(color: .yellow, leftTop: CGPoint(x: 2, y: 22), width: 21, height: 32)
    let expectedRectangle3 = Rectangle(color: .green, leftTop: CGPoint(x: 15, y: 31), width: 29, height: 43)
    
    let factory = ShapeFactory()
    let designer = Designer(factory: factory)
    let draft = designer.createDraft(tasks: tasks)
    
    XCTAssertEqual(expectedRectangle1, draft.shapes[0] as! Rectangle)
    XCTAssertEqual(expectedRectangle2, draft.shapes[1] as! Rectangle)
    XCTAssertEqual(expectedRectangle3, draft.shapes[2] as! Rectangle)
  }
  
  func testAllTypesCorrectShapes() {
    let tasks = ["rectangle black 30 30 400 400",
                 "triangle pink 430 330 360 466 660 330",
                 "polygon yellow 500 500 300 8",
                 "ellipse red 400 400 500 300"]
    
    let expectedRectangle = Rectangle(color: .black, leftTop: CGPoint(x: 30, y: 30), width: 400, height: 400)
    let expectedTriangle = Triangle(color: .systemPink, vertex1: CGPoint(x: 430, y: 330), vertex2: CGPoint(x: 360, y: 466), vertex3: CGPoint(x: 660, y: 330))
    let expectedPolygon = RegularPolygon(color: .yellow, center: CGPoint(x: 500, y: 500), radius: 300, vertexCount: 8)
    let expectedEllipse = Ellipse(color: .red, center: CGPoint(x: 400, y: 400), horizontalRadius: 500, verticalRadius: 300)
    
    let factory = ShapeFactory()
    let designer = Designer(factory: factory)
    let draft = designer.createDraft(tasks: tasks)
    
    XCTAssertEqual(expectedRectangle, draft.shapes[0] as! Rectangle)
    XCTAssertEqual(expectedTriangle, draft.shapes[1] as! Triangle)
    XCTAssertEqual(expectedPolygon, draft.shapes[2] as! RegularPolygon)
    XCTAssertEqual(expectedEllipse, draft.shapes[3] as! Ellipse)
  }
  
  func testTypeOfShapeInDifferentCase() {
    let tasks = ["RecTAnGLe black 30 30 400 400",
                 "TRIANGLE pink 430 330 360 466 660 330",
                 "Polygon yellow 500 500 300 8",
                 "ellipsE red 400 400 500 300"]
    
    let expectedRectangle = Rectangle(color: .black, leftTop: CGPoint(x: 30, y: 30), width: 400, height: 400)
    let expectedTriangle = Triangle(color: .systemPink, vertex1: CGPoint(x: 430, y: 330), vertex2: CGPoint(x: 360, y: 466), vertex3: CGPoint(x: 660, y: 330))
    let expectedPolygon = RegularPolygon(color: .yellow, center: CGPoint(x: 500, y: 500), radius: 300, vertexCount: 8)
    let expectedEllipse = Ellipse(color: .red, center: CGPoint(x: 400, y: 400), horizontalRadius: 500, verticalRadius: 300)
    
    let factory = ShapeFactory()
    let designer = Designer(factory: factory)
    let draft = designer.createDraft(tasks: tasks)
    
    XCTAssertEqual(expectedRectangle, draft.shapes[0] as! Rectangle)
    XCTAssertEqual(expectedTriangle, draft.shapes[1] as! Triangle)
    XCTAssertEqual(expectedPolygon, draft.shapes[2] as! RegularPolygon)
    XCTAssertEqual(expectedEllipse, draft.shapes[3] as! Ellipse)
  }
  
  func testShapeColorInDifferentCase() {
    let tasks = ["rectangle BLACK 30 30 400 400",
                   "triangle Pink 430 330 360 466 660 330",
                   "polygon yelloW 500 500 300 8",
                   "ellipse ReD 400 400 500 300"]
      
    let expectedRectangle = Rectangle(color: .black, leftTop: CGPoint(x: 30, y: 30), width: 400, height: 400)
    let expectedTriangle = Triangle(color: .systemPink, vertex1: CGPoint(x: 430, y: 330), vertex2: CGPoint(x: 360, y: 466), vertex3: CGPoint(x: 660, y: 330))
    let expectedPolygon = RegularPolygon(color: .yellow, center: CGPoint(x: 500, y: 500), radius: 300, vertexCount: 8)
    let expectedEllipse = Ellipse(color: .red, center: CGPoint(x: 400, y: 400), horizontalRadius: 500, verticalRadius: 300)
    
    let factory = ShapeFactory()
    let designer = Designer(factory: factory)
    let draft = designer.createDraft(tasks: tasks)
    
    XCTAssertEqual(expectedRectangle, draft.shapes[0] as! Rectangle)
    XCTAssertEqual(expectedTriangle, draft.shapes[1] as! Triangle)
    XCTAssertEqual(expectedPolygon, draft.shapes[2] as! RegularPolygon)
    XCTAssertEqual(expectedEllipse, draft.shapes[3] as! Ellipse)
  }
  
  func testIncorrectShapes() {
    let tasks = ["resdsdctangle black 30 30 400 400",
                 "triangle @@@@ 430 330 360 466 660 330",
                 "polygon ",
                 "ellipse ellipse"]
    
    let factory = ShapeFactory()
    let designer = Designer(factory: factory)
    let draft = designer.createDraft(tasks: tasks)
    
    XCTAssertTrue(draft.shapes.isEmpty)
  }

}
