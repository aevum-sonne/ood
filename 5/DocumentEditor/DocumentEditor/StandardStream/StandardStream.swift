//
//  StandardStream.swift
//  DocumentEditor
//
//  Created by User on 27.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class StandardStream {
  // I: readLine, O: console
  init() {
    self.input = StandardInputStream()
    self.out = StandardOutputStream(type: .console)
  }
  
  // I: string array, O: string log array
  init(data: [String]) {
    self.input = StandardInputStream(data: data)
    self.out = StandardOutputStream(type: .log)
  }
  
  var input: StandardInputStream
  var out: StandardOutputStream
}
