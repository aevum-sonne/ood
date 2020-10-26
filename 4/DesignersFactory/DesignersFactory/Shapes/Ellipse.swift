//
//  Ellipse.swift
//  DesignersFactory
//
//  Created by User on 13.10.2020.
//  Copyright © 2020 User. All rights reserved.


import Cocoa

class Ellipse: Equatable, ShapeProtocol {
  let color: NSColor

  let center: CGPoint

  let horizontalRadius: CGFloat
  let verticalRadius: CGFloat

  init(color: NSColor, center: CGPoint, horizontalRadius: CGFloat, verticalRadius: CGFloat) {
    self.color = color

    self.center = center

    self.horizontalRadius = horizontalRadius
    self.verticalRadius = verticalRadius
  }
  
  static func ==(lhs: Ellipse, rhs: Ellipse) -> Bool {
    return lhs.color == rhs.color
      && lhs.center == rhs.center
      && lhs.horizontalRadius == rhs.horizontalRadius
      && lhs.verticalRadius == rhs.verticalRadius
  }
  
  func draw(canvas: CanvasProtocol) {
    canvas.setColor(color: color)
    
    canvas.drawEllipse(center: center, horizontalRadius: horizontalRadius, verticalRadius: verticalRadius)
  }
}
