//
//  StandardInputStream.swift
//  DocumentEditor
//
//  Created by User on 27.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

fileprivate enum StreamInputType {
  case console, data
}

struct StandardInputStream {
  init() {
    self.type = .console
  }
  
  init(data: [String]) {
    self.data = data
    
    self.type = .data
  }
  
  mutating func read() -> String? {
    switch type {
      case .console:
        value = readLine()
        
        return value
      
      case .data:
        value = data?.first
        
        if value != nil {
          data?.remove(at: 0)
        }
      
        return value
    }
  }
  
  private(set) var value: String?
  
  private var data: [String]?
  
  private let type: StreamInputType
}
