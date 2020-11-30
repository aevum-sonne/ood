//
//  StandardOutputStream.swift
//  DocumentEditor
//
//  Created by User on 27.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

struct StandardOutputStream: TextOutputStream {
  init(type: StreamOutputType) {
    self.type = type
    
    // Init logs according to output type
    self.logs = (type == .log) ? [String]() : nil
  }
  
  private let type: StreamOutputType
  
  mutating func write(_ string: String) {
    switch type {
      case .console:
        fputs(string, stdout)
      case .log:
        logs?.append(string)
    }
  }
  
  var allLogs: String? {
    get {
      return logs?.joined(separator: "")
    }
  }
  
  private var logs: [String]?
}
