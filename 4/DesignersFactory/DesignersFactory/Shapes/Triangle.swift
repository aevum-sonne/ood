//
//  Triangle.swift
//  DesignersFactory
//
//  Created by User on 13.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Cocoa

class Triangle : NSView, ShapeProtocol {
  let color: NSColor
  
  let vertex1: CGPoint
  let vertex2: CGPoint
  let vertex3: CGPoint
  
  init(frame: CGRect, color: NSColor, vertex1: CGPoint, vertex2: CGPoint, vertex3: CGPoint) {
    self.color = color
    
    self.vertex1 = vertex1
    self.vertex2 = vertex2
    self.vertex3 = vertex3
    
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("NSCoding not supported")
  }
  
  override func draw(_ dirtyRect: NSRect) {
    let figure = NSBezierPath()
    
    figure.move(to: vertex1)
    figure.line(to: vertex2)
    figure.move(to: vertex2)
    figure.line(to: vertex3)
    figure.move(to: vertex3)
    figure.line(to: vertex1)
    
    color.set()
    figure.lineWidth = 2
    figure.stroke()
  }
}
