//
//  FactoryError.swift
//  DesignersFactory
//
//  Created by User on 14.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

enum PrefixMessage: String {
  case invalidArgumentsCount = "Invalid arguments count."
  case invalidColor = "Invalid color."
  case invalidPoint = "Invalid point."
  case invalidRange = "Invalid range."
  case invalidShapeName = "Invalid shape name."
}

enum FactoryError: Error {
  case invalidShape(PrefixMessage)
  case invalidRectangle(PrefixMessage)
  case invalidTriangle(PrefixMessage)
  case invalidRegularPolygon(PrefixMessage)
  case invalidEllipse(PrefixMessage)
}

func handle(factoryError error: FactoryError) {
  let prefix = "Creation Failed."
  
  switch error {
    case .invalidShape(let message):
      print("\(prefix) \(message.rawValue) Invalid Shape. Available Shapes: rectangle, triangle, polygon, ellipse")

    case .invalidRectangle(let message):
      print("\(prefix) \(message.rawValue) Usage: rectangle <color> <left-top> <width> <height>")
    
    case .invalidTriangle(let message):
      print("\(prefix) \(message.rawValue) Usage: triangle <color> <vertex1> <vertex2> <vertex3>")
    
    case .invalidRegularPolygon(let message):
      print("\(prefix) \(message.rawValue) Usage: polygon <color> <center> <radius> <vertex-count>")
    
    case .invalidEllipse(let message):
      print("\(prefix) \(message.rawValue) Usage: rectangle <color> <center> <horizontal-radius> <vertical-radius>")
  }
}
