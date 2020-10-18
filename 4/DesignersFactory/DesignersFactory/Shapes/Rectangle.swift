//
//  Rectangle.swift
//  DesignersFactory
//
//  Created by User on 13.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Cocoa

class Rectangle : NSView, ShapeProtocol {
  let color: NSColor
  
  let leftTop: CGPoint
  
  let width: CGFloat
  let height: CGFloat
  
  init(frame: CGRect, color: NSColor, leftTop: CGPoint, width: CGFloat, height: CGFloat) {
    self.color = color
    
    self.leftTop = leftTop
    
    self.width = width
    self.height = height
    
    super.init(frame: frame)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("NSCoding not supported")
  }
    
  override func draw(_ dirtyRect: NSRect) {
    let rect = NSRect(x: leftTop.x, y: leftTop.y, width: width, height: height)
    let figure = NSBezierPath(rect: rect)
    
    color.set()
    figure.lineWidth = 2
    figure.stroke()
  }
}
