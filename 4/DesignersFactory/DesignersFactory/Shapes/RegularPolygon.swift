//
//  RegularPolygon.swift
//  DesignersFactory
//
//  Created by User on 13.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Cocoa

class RegularPolygon : NSView, ShapeProtocol {
  let color: NSColor

  let center: CGPoint
  let radius: Double
  let vertexCount: UInt

  init(frame: CGRect, color: NSColor, center: CGPoint, radius: Double, vertexCount: UInt) {
    self.color = color
    self.center = center
    self.radius = radius
    self.vertexCount = vertexCount
    
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("NSCoding not supported")
  }

  override func draw(_ dirtyRect: NSRect) {
    let angle = Double.pi * 2 / Double(vertexCount)
    let figure = NSBezierPath()
    
    var from = CGPoint(x: center.x + CGFloat(radius), y: center.y)
    
    for i in 1...vertexCount {
      let to = CGPoint(x: center.x + CGFloat(radius) * CGFloat(cos(angle * Double(i))), y: center.y + CGFloat(radius) * CGFloat(sin(angle * Double(i))))
      
      figure.move(to: from)
      figure.line(to: to)
      
      from = to
    }
    
    color.set()
    figure.lineWidth = 2
    figure.stroke()
  }
}
