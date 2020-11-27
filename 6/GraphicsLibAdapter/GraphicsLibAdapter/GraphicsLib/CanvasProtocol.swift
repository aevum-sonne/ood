//
//  CanvasProtocol.swift
//  GraphicsLib
//
//  Created by User on 24.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

public protocol CanvasProtocol {
  func moveTo(x: Int, y: Int)
  func lineTo(x: Int, y: Int)
}
