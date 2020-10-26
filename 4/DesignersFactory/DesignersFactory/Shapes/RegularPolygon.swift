//
//  RegularPolygon.swift
//  DesignersFactory
//
//  Created by User on 13.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Cocoa

class RegularPolygon: Equatable, ShapeProtocol {
  let color: NSColor

  let center: CGPoint
  let radius: Double
  let vertexCount: UInt

  init(color: NSColor, center: CGPoint, radius: Double, vertexCount: UInt) {
    self.color = color
    
    self.center = center
    self.radius = radius
    self.vertexCount = vertexCount
  }
  
  static func ==(lhs: RegularPolygon, rhs: RegularPolygon) -> Bool {
    return lhs.color == rhs.color
      && lhs.center == rhs.center
      && lhs.radius == rhs.radius
      && lhs.vertexCount == rhs.vertexCount
  }
  
  func draw(canvas: CanvasProtocol) {
    canvas.setColor(color: color)
    
    let angle = Double.pi * 2 / Double(vertexCount)
    
    var from = CGPoint(x: center.x + CGFloat(radius), y: center.y)

    for i in 1...vertexCount {
      let to = CGPoint(x: center.x + CGFloat(radius) * CGFloat(cos(angle * Double(i))), y: center.y + CGFloat(radius) * CGFloat(sin(angle * Double(i))))

      canvas.drawLine(from: from, to: to)

      from = to
    }
  }
}
