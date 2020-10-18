//
//  Ellipse.swift
//  DesignersFactory
//
//  Created by User on 13.10.2020.
//  Copyright © 2020 User. All rights reserved.


import Cocoa

class Ellipse : NSView, ShapeProtocol {
  let color: NSColor

  let center: CGPoint

  let horizontalRadius: CGFloat
  let verticalRadius: CGFloat

  init(frame: CGRect, color: NSColor, center: CGPoint, horizontalRadius: CGFloat, verticalRadius: CGFloat) {
    self.color = color

    self.center = center

    self.horizontalRadius = horizontalRadius
    self.verticalRadius = verticalRadius
    
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("NSCoding not supported")
  }
  
  override func draw(_ dirtyRect: NSRect) {
    let figure = NSBezierPath(ovalIn: CGRect(x: center.x, y: center.y, width: horizontalRadius, height: verticalRadius))
    
    color.set()
    figure.lineWidth = 2
    figure.stroke()
  }
}
