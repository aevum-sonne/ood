//
//  ShapesTests.swift
//  DesignersFactoryTests
//
//  Created by User on 16.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

@testable import DesignersFactory

import XCTest

class ShapesTests: XCTestCase {
  let frame = CGRect(x: 0, y: 0, width: 1000, height: 1000)
  
  func testRectangle() {
    let color: NSColor = .black
    let leftTop = CGPoint(x: 66, y: 66)
    let width: CGFloat = 133
    let height: CGFloat = 133
    
    let rectangle = Rectangle(frame: frame, color: color, leftTop: leftTop, width: width, height: height)
    
    XCTAssertEqual(color, rectangle.color)
    XCTAssertEqual(leftTop, rectangle.leftTop)
    XCTAssertEqual(width, rectangle.width)
    XCTAssertEqual(height, rectangle.height)
  }
  
  func testTriangle() {
    let color: NSColor = .yellow
    let vertex1 = CGPoint(x: 1, y: 1)
    let vertex2 = CGPoint(x: 6, y: 6)
    let vertex3 = CGPoint(x: 12, y: 1)
    
    let triangle = Triangle(frame: frame, color: color, vertex1: vertex1, vertex2: vertex2, vertex3: vertex3)
    
    XCTAssertEqual(color, triangle.color)
    XCTAssertEqual(vertex1, triangle.vertex1)
    XCTAssertEqual(vertex2, triangle.vertex2)
    XCTAssertEqual(vertex3, triangle.vertex3)
  }
  
  func testRegularPolygon() {
    let color: NSColor = .green
    let center = CGPoint(x: 50, y: 50)
    let radius: Double = 20
    let vertexCount: UInt = 12
    
    let polygon = RegularPolygon(frame: frame, color: color, center: center, radius: radius, vertexCount: vertexCount)
    
    XCTAssertEqual(color, polygon.color)
    XCTAssertEqual(center, polygon.center)
    XCTAssertEqual(radius, polygon.radius)
    XCTAssertEqual(vertexCount, polygon.vertexCount)
  }
  
  func testEllipse() {
    let color: NSColor = .systemPink
    let center = CGPoint(x: 150, y: 150)
    let horizontalRadius: CGFloat = 40
    let verticalRadius: CGFloat = 60

    let ellipse = Ellipse(frame: frame, color: color, center: center, horizontalRadius: horizontalRadius, verticalRadius: verticalRadius)
    
    XCTAssertEqual(color, ellipse.color)
    XCTAssertEqual(center, ellipse.center)
    XCTAssertEqual(horizontalRadius, ellipse.horizontalRadius)
    XCTAssertEqual(verticalRadius, ellipse.verticalRadius)
  }
}
