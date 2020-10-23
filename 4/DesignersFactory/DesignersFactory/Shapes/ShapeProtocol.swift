//
//  ShapeProtocol.swift
//  DesignersFactory
//
//  Created by User on 13.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Cocoa

protocol ShapeProtocol {
  var color: NSColor { get }
  
  func draw(canvas: CanvasProtocol)
}
