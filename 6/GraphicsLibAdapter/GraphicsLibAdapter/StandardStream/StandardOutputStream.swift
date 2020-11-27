//
//  StandardOutputStream.swift
//  StandardOutputStream
//
//  Created by User on 26.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

public struct StandardOutputStream: TextOutputStream {
  public init(type: OutputType) {
    self.type = type
    
    // Init logs according to output type
    self.logs = (type == .log) ? [String]() : nil
  }
  
  private let type: OutputType
  
  public mutating func write(_ string: String) {
    switch type {
      case .console:
        fputs(string, stdout)
      case .log:
        logs?.append(string)
    }
  }
  
  public var lastLog: String? {
    get {
      return logs?.last
    }
  }
  
  public var allLogs: String? {
    get {
      return logs?.joined(separator: "")
    }
  }
  
  private var logs: [String]?
}

