//
//  ShapeComparator.swift
//  DesignersFactoryTests
//
//  Created by User on 16.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

@testable import DesignersFactory

import Foundation

class ShapeComparator {
  static func compareRectangles(lhs: Rectangle, rhs: Rectangle) -> Bool {
    return lhs.color == rhs.color
      && lhs.leftTop == rhs.leftTop
      && lhs.width == rhs.width
      && lhs.height == rhs.height
  }
  
  static func compareTriangles(lhs: Triangle, rhs: Triangle) -> Bool {
    return lhs.color == rhs.color
      && lhs.vertex1 == rhs.vertex1
      && lhs.vertex2 == rhs.vertex2
      && lhs.vertex3 == rhs.vertex3
  }
  
  static func comparePolygons(lhs: RegularPolygon, rhs: RegularPolygon) -> Bool {
    return lhs.color == rhs.color
      && lhs.center == rhs.center
      && lhs.radius == rhs.radius
      && lhs.vertexCount == rhs.vertexCount
  }
  
  static func compareEllipses(lhs: Ellipse, rhs: Ellipse) -> Bool {
    return lhs.color == rhs.color
      && lhs.center == rhs.center
      && lhs.horizontalRadius == rhs.horizontalRadius
      && lhs.verticalRadius == rhs.verticalRadius
  }
}
