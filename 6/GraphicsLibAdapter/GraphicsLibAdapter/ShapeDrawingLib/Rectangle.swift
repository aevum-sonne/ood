//
//  Rectangle.swift
//  ShapeDrawing
//
//  Created by User on 24.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import GraphicsLib

public class Rectangle: CanvasDrawableProtocol {
  public required init(leftTop: CGPoint, width: Int, height: Int) {
    self.leftTop = leftTop
    
    self.width = width
    self.height = height
  }
  
  public func draw(canvas: GraphicsLib.CanvasProtocol) {
    let rightTop = CGPoint(x: Int(leftTop.x) + width, y: Int(leftTop.y) + height)
    let leftBottom = CGPoint(x: Int(leftTop.x) + width, y: Int(leftTop.y) - height)
    let rightBottom = CGPoint(x: Int(rightTop.x), y: Int(rightTop.y) - height)
    
    canvas.moveTo(x: Int(leftTop.x), y: Int(leftTop.y))
    canvas.lineTo(x: Int(rightTop.x), y: Int(rightTop.y))
    
    canvas.moveTo(x: Int(rightTop.x), y: Int(rightTop.y))
    canvas.lineTo(x: Int(rightBottom.x), y: Int(rightBottom.y))
    
    canvas.moveTo(x: Int(rightBottom.x), y: Int(rightBottom.y))
    canvas.lineTo(x: Int(leftBottom.x), y: Int(leftBottom.y))
    
    canvas.moveTo(x: Int(leftBottom.x), y: Int(leftBottom.y))
    canvas.lineTo(x: Int(leftTop.x), y: Int(leftTop.y))
  }
  
  private let leftTop: CGPoint
  
  private let width: Int
  private let height: Int
}
