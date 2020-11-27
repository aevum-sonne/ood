//
//  CanvasPainter.swift
//  ShapeDrawing
//
//  Created by User on 24.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import GraphicsLib

public class CanvasPainter {
  public required init(canvas: CanvasProtocol) {
    self.canvas = canvas
  }
  
  public func draw(drawable: CanvasDrawableProtocol) {
    drawable.draw(canvas: canvas)
  }
  
  private let canvas: CanvasProtocol
}
