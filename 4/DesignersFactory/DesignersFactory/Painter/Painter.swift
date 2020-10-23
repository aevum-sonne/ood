//
//  Painter.swift
//  DesignersFactory
//
//  Created by User on 16.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Cocoa

class Painter {
  func drawPicture(canvas: CanvasProtocol, draft: PictureDraft) {
    for shape in draft.shapes {
      shape.draw(canvas: canvas)
    }
  }
}
