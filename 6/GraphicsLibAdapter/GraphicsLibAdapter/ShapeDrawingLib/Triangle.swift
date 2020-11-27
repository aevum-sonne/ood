//
//  Triangle.swift
//  ShapeDrawing
//
//  Created by User on 24.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import GraphicsLib

public class Triangle: CanvasDrawableProtocol {
  public required init (p1: CGPoint, p2: CGPoint, p3: CGPoint) {
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }
  
  public func draw(canvas: GraphicsLib.CanvasProtocol) {
    canvas.moveTo(x: Int(p1.x), y: Int(p1.y))
    canvas.lineTo(x: Int(p2.x), y: Int(p2.y))
    
    canvas.moveTo(x: Int(p2.x), y: Int(p2.y))
    canvas.lineTo(x: Int(p3.x), y: Int(p3.y))
    
    canvas.moveTo(x: Int(p3.x), y: Int(p3.y))
    canvas.lineTo(x: Int(p1.x), y: Int(p1.y))
  }
  
  private let p1: CGPoint
  private let p2: CGPoint
  private let p3: CGPoint
}
