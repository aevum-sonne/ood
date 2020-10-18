//
//  ShapeFactory.swift
//  DesignersFactory
//
//  Created by User on 13.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Cocoa

class ShapeFactory: ShapeFactoryProtocol {
  func createShape(description: String) throws -> ShapeProtocol {
    let args = description.split(separator: " ").map { $0.lowercased() }

    do {
      let shape = try parseArgs(args: args)

      return shape
    }

    catch let factoryError as FactoryError {
      throw factoryError
    }
  }

  private func parseArgs(args: [String]) throws -> ShapeProtocol {
    if (args.isEmpty) {
      throw FactoryError.invalidShape(.invalidArgumentsCount)
    }

    let type = args.first
    let shapeDescription = args[1...].map { String($0) }

    var shape: ShapeProtocol

    do {
      switch (type) {
        case "rectangle":
          shape = try createRectangle(description: shapeDescription)

        case "triangle":
          shape = try createTriangle(description: shapeDescription)
        
        case "polygon":
          shape = try createPolygon(description: shapeDescription)
        
        case "ellipse":
          shape = try createEllipse(description: shapeDescription)

        case .none, .some(_):
          throw FactoryError.invalidShape(.invalidShapeName)
      }
    }

    catch let error as FactoryError {
      throw error
    }

    return shape
  }
  
  private let frame = CGRect(x: 0, y: 0, width: 1000, height: 1000)

  private func createRectangle(description: [String]) throws -> ShapeProtocol {
    if description.count != 5 {
      throw FactoryError.invalidRectangle(.invalidArgumentsCount)
    }

    guard let color = createColor(color: description[0]) else {
      throw FactoryError.invalidRectangle(.invalidColor)
    }

    guard let leftTop = createPoint(x: description[1], y: description[2]) else {
      throw FactoryError.invalidRectangle(.invalidPoint)
    }
    
    guard let width = Double(description[3]),
      let height = Double(description[4]) else {
        throw FactoryError.invalidRectangle(.invalidRange)
      }
    
    return Rectangle(frame: frame, color: color, leftTop: leftTop, width: CGFloat(width), height: CGFloat(height))
  }

  private func createTriangle(description: [String]) throws -> ShapeProtocol {
    if description.count != 7 {
      throw FactoryError.invalidTriangle(.invalidArgumentsCount)
    }

    guard let color = createColor(color: description[0]) else {
      throw FactoryError.invalidTriangle(.invalidColor)
    }

    guard let vertex1 = createPoint(x: description[1], y: description[2]),
      let vertex2 = createPoint(x: description[3], y: description[4]),
      let vertex3 = createPoint(x: description[5], y: description[6])
      else {
        throw FactoryError.invalidTriangle(.invalidPoint)
    }

    return Triangle(frame: frame, color: color, vertex1: vertex1, vertex2: vertex2, vertex3: vertex3)
  }
  
  private func createPolygon(description: [String]) throws -> ShapeProtocol {
    
    if description.count != 5 {
      throw FactoryError.invalidRegularPolygon(.invalidArgumentsCount)
    }
    
    guard let color = createColor(color: description[0]) else {
      throw FactoryError.invalidRegularPolygon(.invalidColor)
    }
    
    guard let center = createPoint(x: description[1], y: description[2]) else {
      throw FactoryError.invalidRegularPolygon(.invalidPoint)
    }
    
    guard let radius = Double(description[3]) else {
      throw FactoryError.invalidRegularPolygon(.invalidRange)
    }
    
    guard let vertexCount = UInt(description[4]), vertexCount > 0 else {
      throw FactoryError.invalidRegularPolygon(.invalidRange)
    }
    
    return RegularPolygon(frame: frame, color: color, center: center, radius: radius, vertexCount: vertexCount)
  }
  
  private func createEllipse(description: [String]) throws -> ShapeProtocol {

    if description.count != 5 {
      throw FactoryError.invalidEllipse(.invalidArgumentsCount)
    }

    guard let color = createColor(color: description[0]) else {
      throw FactoryError.invalidEllipse(.invalidColor)
    }

    guard let center = createPoint(x: description[1], y: description[2]) else {
      throw FactoryError.invalidEllipse(.invalidPoint)
    }

    guard let horizontalRadius = Double(description[3]),
      let verticalRadius = Double(description[4])
      else {
        throw FactoryError.invalidEllipse(.invalidRange)
    }

    return Ellipse(frame: frame, color: color, center: center, horizontalRadius: CGFloat(horizontalRadius), verticalRadius: CGFloat(verticalRadius))
   }

  private func createColor(color: String) -> NSColor? {
    if let correctColor = Color(rawValue: color)?.convert {
      return correctColor
    } else {
      return nil
    }
  }

  private func createPoint(x: String, y: String) -> CGPoint? {
    if let correctX = Double(x), let correctY = Double(y) {
      return CGPoint(x: correctX, y: correctY)
    } else {
      return nil
    }
  }
}
