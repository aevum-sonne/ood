//
//  RGBAColor.swift
//  ModernGraphicsLibPro
//
//  Created by User on 26.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

public struct RGBAColor {
  public init(r: Double, g: Double, b: Double, a: Double) {
    self.r = r
    self.g = g
    self.b = b
    self.a = a
  }
  
  let r: Double
  let g: Double
  let b: Double
  let a: Double
}
