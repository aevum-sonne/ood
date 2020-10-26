//
//  Triangle.swift
//  DesignersFactory
//
//  Created by User on 13.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Cocoa

class Triangle: Equatable, ShapeProtocol {
  let color: NSColor
  
  let vertex1: CGPoint
  let vertex2: CGPoint
  let vertex3: CGPoint
  
  init(color: NSColor, vertex1: CGPoint, vertex2: CGPoint, vertex3: CGPoint) {
    self.color = color
    
    self.vertex1 = vertex1
    self.vertex2 = vertex2
    self.vertex3 = vertex3
  }
  
  static func ==(lhs: Triangle, rhs: Triangle) -> Bool {
    return lhs.color == rhs.color
      && lhs.vertex1 == rhs.vertex1
      && lhs.vertex2 == rhs.vertex2
      && lhs.vertex3 == rhs.vertex3
  }

  func draw(canvas: CanvasProtocol) {
    canvas.setColor(color: color)
    
    canvas.drawLine(from: vertex1, to: vertex2)
    canvas.drawLine(from: vertex2, to: vertex3)
    canvas.drawLine(from: vertex3, to: vertex1)
  }
}
