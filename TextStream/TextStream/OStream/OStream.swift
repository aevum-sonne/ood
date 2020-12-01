//
//  OStream.swift
//  TextStream
//
//  Created by User on 01.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

public class OStream {
  public init(type: TextOType) {
    self.stream = TextOStream(type: type)
  }
  
  public var logs: String? {
    get {
      return stream.logs?.joined(separator: "")
    }
  }
  
  public var lastLog: String? {
    get {
      if let last = stream.logs?.last {
        if last == "\n" {
          return stream.logs?.dropLast().last
        } else {
          return last
        }
      } else {
        return nil
      }
    }
  }
  
  public var stream: TextOStream
}
