//
//  GraphicsLibAdapterPro.swift
//  App
//
//  Created by User on 27.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import GraphicsLibPro
import ModernGraphicsLibPro

public class GraphicsLibAdapterPro: GraphicsLibPro.CanvasProtocol {
  public init(renderer: ModernGraphicsLibPro.ModernGraphicsRendererPro) throws {
    try renderer.beginDraw()
    
    self.renderer = renderer
    
    self.color = ModernGraphicsLibPro.RGBAColor(r: 0, g: 0, b: 0, a: defaultAlpha)
  }
  
  public func setColor(color: UInt32) {
    let r = (color >> 16) & 0xFF
    let g = (color >> 8) & 0xFF
    let b = color & 0xFF
    
    self.color = ModernGraphicsLibPro.RGBAColor(r: Double(r) / 255, g: Double(g) / 255, b: Double(b) / 255, a: defaultAlpha)
  }
  
  public func moveTo(x: Int, y: Int) {
    from = CGPoint(x: x, y: y)
  }
  
  public func lineTo(x: Int, y: Int) {
    do {
      try renderer.drawLine(start: from, end: CGPoint(x: x, y: y), color: color)
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  private let renderer: ModernGraphicsLibPro.ModernGraphicsRendererPro
  
  private let defaultAlpha: Double = 1
  private var color: ModernGraphicsLibPro.RGBAColor
  
  private var from = CGPoint()
}
