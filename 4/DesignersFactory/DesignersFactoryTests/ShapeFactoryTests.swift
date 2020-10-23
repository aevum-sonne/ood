//
//  ShapeFactoryTests.swift
//  DesignersFactoryTests
//
//  Created by User on 16.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

@testable import DesignersFactory

import XCTest

class ShapeFactoryTests: XCTestCase {
  
  func testCreateCorrectShapesNoThrow() {
    let factory = ShapeFactory()
    
    XCTAssertNoThrow(try factory.createShape(description: "rectangle black 5 120 360 30"))
    XCTAssertNoThrow(try factory.createShape(description: "triangle pink 430 330 360 466 660 330"))
    XCTAssertNoThrow(try factory.createShape(description: "polygon green 330 500 440 6"))
    XCTAssertNoThrow(try factory.createShape(description: "ellipse red 400 400 500 300"))
  }
  
  func testCreateCorrectShapes() {
    let factory = ShapeFactory()
    
    let expectedRectangle = Rectangle(color: .black, leftTop: CGPoint(x: 5, y: 120), width: 360, height: 30)
    let rectangle = try! factory.createShape(description: "rectangle black 5 120 360 30") as! Rectangle
    
    XCTAssertEqual(expectedRectangle, rectangle)
    
    let expectedTriangle = Triangle(color: .green, vertex1: CGPoint(x: 0, y: 0), vertex2: CGPoint(x: 66, y: 66), vertex3: CGPoint(x: 122, y: 0))
    let triangle = try! factory.createShape(description: "triangle green 0 0 66 66 122 0") as! Triangle
    
    XCTAssertEqual(expectedTriangle, triangle)
    
    let expectedPolygon = RegularPolygon(color: .systemPink, center: CGPoint(x: 85, y: 226), radius: 70, vertexCount: 12)
    let polygon = try! factory.createShape(description: "polygon pink 85 226 70 12") as! RegularPolygon
    
    XCTAssertEqual(expectedPolygon, polygon)
    
    let expectedEllipse = Ellipse(color: .green, center: CGPoint(x: 85, y: 226), horizontalRadius: 33, verticalRadius: 56)
    let ellipse = try! factory.createShape(description: "ellipse green 85 226 33 56") as! Ellipse
    
    XCTAssertEqual(expectedEllipse, ellipse)
  }
  
  func testCreateShapeEmptyString() {
    let factory = ShapeFactory()

    XCTAssertThrowsError(try factory.createShape(description: "")) { error in
      switch error as! FactoryError  {
        case .invalidShape(.invalidArgumentsCount):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }
  }
  
  func testCreateShapeWithoutArguments() {
    let factory = ShapeFactory()
    
    XCTAssertThrowsError(try factory.createShape(description: "rectangle")) { error in
      switch error as! FactoryError  {
        case .invalidRectangle(.invalidArgumentsCount):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }
    
    XCTAssertThrowsError(try factory.createShape(description: "triangle")) { error in
      switch error as! FactoryError  {
        case .invalidTriangle(.invalidArgumentsCount):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }
    
    XCTAssertThrowsError(try factory.createShape(description: "polygon")) { error in
      switch error as! FactoryError  {
        case .invalidRegularPolygon(.invalidArgumentsCount):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }
    
    XCTAssertThrowsError(try factory.createShape(description: "ellipse")) { error in
      switch error as! FactoryError  {
        case .invalidEllipse(.invalidArgumentsCount):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }
  }
  
  func testCreateShapeInvalidArgumentsCount() {
    let factory = ShapeFactory()

    XCTAssertThrowsError(try factory.createShape(description: "rectangle black 1 2 3 4 5 6 7 8 9")) { error in
      switch error as! FactoryError  {
        case .invalidRectangle(.invalidArgumentsCount):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }
    
    XCTAssertThrowsError(try factory.createShape(description: "triangle yellow 9")) { error in
      switch error as! FactoryError  {
        case .invalidTriangle(.invalidArgumentsCount):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }
    
    XCTAssertThrowsError(try factory.createShape(description: "polygon yellow 9123122131231213")) { error in
      switch error as! FactoryError  {
        case .invalidRegularPolygon(.invalidArgumentsCount):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }
    
    XCTAssertThrowsError(try factory.createShape(description: "ellipse black")) { error in
      switch error as! FactoryError  {
        case .invalidEllipse(.invalidArgumentsCount):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }

  }

  func testCreateShapeWithIncorrectColor() {
    let factory = ShapeFactory()
    
    XCTAssertThrowsError(try factory.createShape(description: "rectangle b 330 500 440 6")) { error in
      switch error as! FactoryError  {
        case .invalidRectangle(.invalidColor):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }
    
    XCTAssertThrowsError(try factory.createShape(description: "triangle p@@ink 430 330 360 466 660 330")) { error in
      switch error as! FactoryError  {
        case .invalidTriangle(.invalidColor):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }

    XCTAssertThrowsError(try factory.createShape(description: "polygon greeen 330 500 440 6")) { error in
      switch error as! FactoryError  {
        case .invalidRegularPolygon(.invalidColor):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }
    
    XCTAssertThrowsError(try factory.createShape(description: "ellipse resdsd 400 400 500 300")) { error in
      switch error as! FactoryError  {
        case .invalidEllipse(.invalidColor):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }
  }

  func testCreateShapeWithIncorrectPoint() {
    let factory = ShapeFactory()

    XCTAssertThrowsError(try factory.createShape(description: "rectangle green @@@#### 500 1 123")) { error in
      switch error as! FactoryError  {
        case .invalidRectangle(.invalidPoint):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }

    XCTAssertThrowsError(try factory.createShape(description: "triangle green 330 /sd 55 2 23 23")) { error in
      switch error as! FactoryError  {
        case .invalidTriangle(.invalidPoint):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }
    
    XCTAssertThrowsError(try factory.createShape(description: "polygon green 330 /sd 55 2")) { error in
      switch error as! FactoryError  {
        case .invalidRegularPolygon(.invalidPoint):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }
    
    XCTAssertThrowsError(try factory.createShape(description: "ellipse red @@@ 400 500 300")) { error in
      switch error as! FactoryError  {
        case .invalidEllipse(.invalidPoint):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }
    
    XCTAssertThrowsError(try factory.createShape(description: "ellipse red 400 @@@ 500 300")) { error in
      switch error as! FactoryError  {
        case .invalidEllipse(.invalidPoint):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }
  }
  
  func testCreateShapeWithIncorrectDistanceArgument() {
    let factory = ShapeFactory()

    XCTAssertThrowsError(try factory.createShape(description: "rectangle green 330 500 a 123")) { error in
      switch error as! FactoryError  {
        case .invalidRectangle(.invalidDistance):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }

    XCTAssertThrowsError(try factory.createShape(description: "rectangle green 330 500 55 a")) { error in
      switch error as! FactoryError  {
        case .invalidRectangle(.invalidDistance):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }
    
    XCTAssertThrowsError(try factory.createShape(description: "polygon green 330 45 /123 2")) { error in
      switch error as! FactoryError  {
        case .invalidRegularPolygon(.invalidDistance):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }
    
    XCTAssertThrowsError(try factory.createShape(description: "polygon green 330 123 55 asd")) { error in
      switch error as! FactoryError  {
        case .invalidRegularPolygon(.invalidDistance):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }
    
    XCTAssertThrowsError(try factory.createShape(description: "ellipse red 400 300 @@@ 300")) { error in
      switch error as! FactoryError  {
        case .invalidEllipse(.invalidDistance):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }
    
    XCTAssertThrowsError(try factory.createShape(description: "ellipse red 400 300 23 #########")) { error in
      switch error as! FactoryError  {
        case .invalidEllipse(.invalidDistance):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }
  }
  
  func testDivisionByZeroVertexCount() {
    let factory = ShapeFactory()

    XCTAssertThrowsError(try factory.createShape(description: "polygon green 330 500 440 0")) { error in
      switch error as! FactoryError  {
        case .invalidRegularPolygon(.invalidDistance):
          XCTAssertTrue(true)
        default:
          XCTFail()
      }
    }
  }
}
