//
//  Canvas.swift
//  DesignersFactory
//
//  Created by User on 19.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Cocoa

class Canvas: NSView, CanvasProtocol {
  var color: NSColor = .black
  var canvasFrame: CGRect
  
  override init(frame: CGRect) {
    self.canvasFrame = frame
    
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("NSCoding not supported")
  }
  
  func setColor(color: NSColor) {
    self.color = color
  }
  
  func drawLine(from: CGPoint, to: CGPoint) {
    self.subviews.append(LineView(frame: canvasFrame, color: color, from: from, to: to))
  }
  
  func drawEllipse(center: CGPoint, horizontalRadius: CGFloat, verticalRadius: CGFloat) {
    self.subviews.append(EllipseView(frame: canvasFrame, color: color, center: center, horizontalRadius: horizontalRadius, verticalRadius: verticalRadius))
  }
}

fileprivate class LineView: NSView {
  init(frame: CGRect, color: NSColor, from: CGPoint, to: CGPoint) {
    self.color = color
    self.from = from
    self.to = to
    
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("NSCoding not supported")
  }
  
  override func draw(_ dirtyRect: NSRect) {
    let line = NSBezierPath()
    
    line.move(to: from)
    line.line(to: to)
    
    color.set()
    line.lineWidth = 2
    line.stroke()
  }
  
  private let color: NSColor
  private let from: CGPoint
  private let to: CGPoint
}

fileprivate class EllipseView: NSView {
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
    let ellipse = NSBezierPath(ovalIn: CGRect(x: center.x, y: center.y, width: horizontalRadius, height: verticalRadius))
    
    color.set()
    ellipse.lineWidth = 2
    ellipse.stroke()
  }
  
  private let color: NSColor
  private let center: CGPoint
  private let horizontalRadius: CGFloat
  private let verticalRadius: CGFloat
}
