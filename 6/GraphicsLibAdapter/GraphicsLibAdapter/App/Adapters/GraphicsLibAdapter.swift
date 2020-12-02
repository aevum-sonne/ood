//
//  GraphicsLibAdapter.swift
//  App
//
//  Created by User on 26.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import GraphicsLib
import ModernGraphicsLib

public class GraphicsLibAdapter: CanvasProtocol {
  public init(renderer: ModernGraphicsRenderer) throws {
    try renderer.beginDraw()
    
    self.renderer = renderer
  }
  
  deinit {
    try? renderer.endDraw()
  }
  
  public func moveTo(x: Int, y: Int) {
    from = CGPoint(x: x, y: y)
  }
  
  public func lineTo(x: Int, y: Int) {
    do {
      try renderer.drawLine(start: from, end: CGPoint(x: x, y: y))
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  private var renderer: ModernGraphicsRenderer
  
  private var from = CGPoint()
}
