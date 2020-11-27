//
//  Canvas.swift
//  GraphicsLib
//
//  Created by User on 24.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

public class Canvas: CanvasProtocol {
  public required init() { }
  
  public func moveTo(x: Int, y: Int) {
    print("Move to (\(x), \(y))")
  }
  
  public func lineTo(x: Int, y: Int) {
    print("Line to (\(x), \(y))")
  }
}
