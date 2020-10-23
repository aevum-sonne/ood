//
//  CanvasProtocol.swift
//  DesignersFactory
//
//  Created by User on 19.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Cocoa

protocol CanvasProtocol {
  var color: NSColor { get }
  
  func setColor(color: NSColor)
  
  func drawLine(from: CGPoint, to: CGPoint)
  func drawEllipse(center: CGPoint, horizontalRadius: CGFloat, verticalRadius: CGFloat)
}
