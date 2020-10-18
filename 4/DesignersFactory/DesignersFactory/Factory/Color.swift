//
//  Color.swift
//  ShapeFactory
//
//  Created by User on 13.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Cocoa

enum Color: String {
  case green = "green"
  case red = "red"
  case blue = "blue"
  case yellow = "yellow"
  case pink = "pink"
  case black = "black"
  
  var convert: NSColor {
    switch self {
      case .green:
        return NSColor.green
      case .red:
        return NSColor.red
      case .blue:
        return NSColor.blue
      case .yellow:
        return NSColor.yellow
      case .pink:
        return NSColor.systemPink
      case .black:
        return NSColor.black
    }
  }
}
