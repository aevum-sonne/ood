//
//  App.swift
//  App
//
//  Created by User on 26.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

import GraphicsLib
import ModernGraphicsLib
import ShapeDrawingLib

import StandardStream

public func paintPicture(painter: ShapeDrawingLib.CanvasPainter) {
  let triangle = ShapeDrawingLib.Triangle(p1: CGPoint(x: 10, y: 15), p2: CGPoint(x: 100, y: 200), p3: CGPoint(x: 150, y: 250))
  let rectangle = ShapeDrawingLib.Rectangle(leftTop: CGPoint(x: 30, y: 40), width: 18, height: 24)

  painter.draw(drawable: triangle)
  painter.draw(drawable: rectangle)
}

public func paintPictureOnCanvas() {
  let canvas = GraphicsLib.Canvas()
  let painter = ShapeDrawingLib.CanvasPainter(canvas: canvas)

  paintPicture(painter: painter)
}

public func paintPictureOnModernGraphicsRenderer() {
  let stream = StandardStream(outType: .console)

  let renderer = ModernGraphicsLib.ModernGraphicsRenderer(stream: stream)
  do {
    try renderer.beginDraw()
    try renderer.endDraw()
  } catch let error {
    print(error.localizedDescription)
  }
}
