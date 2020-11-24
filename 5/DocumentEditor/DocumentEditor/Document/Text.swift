//
//  Text.swift
//  DocumentEditor
//
//  Created by User on 30.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class Text: TextProtocol {
  var value: String
  
  init(value: String) {
    self.value = value
  }
}
