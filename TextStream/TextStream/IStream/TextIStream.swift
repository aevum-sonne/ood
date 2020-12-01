//
//  TextIStream.swift
//  TextStream
//
//  Created by User on 01.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

public struct TextIStream {
  // Constructor for readLine() input
  internal init() {
    self.type = .console
  }
  
  // Constructor for manual input by string array
  internal init(data: [String]) {
    self.data = data
    
    self.type = .data
  }
  
  public mutating func read() -> String? {
    switch type {
      case .console:
        let value = readLine()
        
        return value
      case .data:
        let value = data?.first
        
        if value != nil {
          data?.remove(at: 0)
        }
      
        return value
    }
  }
    
  private var data: [String]?
  
  private let type: TextIType
}
