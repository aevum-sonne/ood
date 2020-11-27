//
//  CanvasProtocol.swift
//  GraphicsLibPro
//
//  Created by User on 26.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

public protocol CanvasProtocol {
  func setColor(color: UInt32)
  
  func moveTo(x: Int, y: Int)
  func lineTo(x: Int, y: Int)
}
