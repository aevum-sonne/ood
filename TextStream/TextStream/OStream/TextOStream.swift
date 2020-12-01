//
//  TextOStream.swift
//  TextStream
//
//  Created by User on 01.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

public struct TextOStream: TextOutputStream {
  internal init(type: TextOType) {
    self.type = type
    
    self.logs = (type == .logs) ? [String]() : nil
  }
  
  private let type: TextOType
  
  public mutating func write(_ string: String) {
    switch type {
      case .console:
        fputs(string, stdout)
      case .logs:
        logs?.append(string)
    }
  }
  
  private(set) var logs: [String]?
}
