//
//  Rectangle.swift
//  DesignersFactory
//
//  Created by User on 13.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Cocoa

class Rectangle: Equatable, ShapeProtocol {
  let color: NSColor
  
  let leftTop: CGPoint
  
  let width: CGFloat
  let height: CGFloat
  
  static func ==(lhs: Rectangle, rhs: Rectangle) -> Bool {
    return lhs.color == rhs.color
      && lhs.leftTop == rhs.leftTop
      && lhs.height == rhs.height
      && lhs.width == rhs.width
  }
  
  init(color: NSColor, leftTop: CGPoint, width: CGFloat, height: CGFloat) {
    self.color = color
    
    self.leftTop = leftTop
    
    self.width = width
    self.height = height
  }
    
  func draw(canvas: CanvasProtocol) {
    canvas.setColor(color: color)
    
    let rightTop = CGPoint(x: leftTop.x + width, y: leftTop.y)
    let leftBottom = CGPoint(x: leftTop.x, y: leftTop.y - height)
    let rightBottom = CGPoint(x: rightTop.x, y: rightTop.y - height)
    
    canvas.drawLine(from: leftTop, to: rightTop)
    canvas.drawLine(from: rightTop, to: rightBottom)
    canvas.drawLine(from: rightBottom, to: leftBottom)
    canvas.drawLine(from: leftBottom, to: leftTop)
  }
}
