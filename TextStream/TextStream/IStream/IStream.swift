//
//  IStream.swift
//  TextStream
//
//  Created by User on 01.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

public class IStream {
  // Read data by readLine()
  public init() {
    self.stream = TextIStream()
  }
  
  // Read data by string array
  public init(data: [String]) {
    self.stream = TextIStream(data: data)
  }
  
  public var stream: TextIStream
}
