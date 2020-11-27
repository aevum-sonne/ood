//
//  StandardStream.swift
//  StandardOutputStream
//
//  Created by User on 26.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

public class StandardStream {
  public init(outType: OutputType) {
    out = StandardOutputStream(type: outType)
  }
  
  public var out: StandardOutputStream
}
