//
//  Canvas.swift
//  GraphicsLibPro
//
//  Created by User on 26.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

public class Canvas: CanvasProtocol {
  public func setColor(color: UInt32) {
    print("Set color #\(color)")
  }
  
  public func moveTo(x: Int, y: Int) {
    print("Move to (\(x), \(y))")
  }
  
  public func lineTo(x: Int, y: Int) {
    print("Line to (\(x), \(y))")
  }
}
