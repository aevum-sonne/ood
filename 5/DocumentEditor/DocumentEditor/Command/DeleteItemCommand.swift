//
//  DeleteItemCommand.swift
//  DocumentEditor
//
//  Created by User on 29.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import Cocoa

class DeleteItemCommand: CommandProtocol {
  init(items: DocumentItemArrayProtocol, position: Int) {
    self.items = items
    self.item = items.value[position]
    
    self.position = position
  }
  
  deinit {
    if self.item?.image != nil {
      self.item = nil
    }
  }
  
  func execute() {
    items.value.remove(at: position)
  }
  
  func unexecute() {
    items.value.insert(item!, at: position)
  }
  
  private var items: DocumentItemArrayProtocol
  private var item: DocumentItemProtocol?
  
  private let position: Int
}
