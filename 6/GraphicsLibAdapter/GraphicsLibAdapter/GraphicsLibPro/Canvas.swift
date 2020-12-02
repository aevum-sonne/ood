//
//  Canvas.swift
//  GraphicsLibPro
//
//  Created by User on 26.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import TextStream

public class Canvas: CanvasProtocol {
  public required init(outStream: TextStream.OStream) {
    self.out = outStream
  }
  
  public func setColor(color: UInt32) {
    print("Set color #\(color)", to: &out.stream)
  }
  
  public func moveTo(x: Int, y: Int) {
    print("Move to (\(x), \(y))", to: &out.stream)
  }
  
  public func lineTo(x: Int, y: Int) {
    print("Line to (\(x), \(y))", to: &out.stream)
  }
  
  public let out: TextStream.OStream
}
