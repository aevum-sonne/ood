//
//  InsertItemCommand.swift
//  DocumentEditor
//
//  Created by User on 27.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class InsertItemCommand: CommandProtocol {
  init(item: DocumentItemProtocol, items: DocumentItemArrayProtocol, position: Int) {
    self.item = item
    self.items = items
    
    self.position = position
  }
  
  func execute() {
    items.value.insert(item, at: position)
  }
  
  func unexecute() {
    items.value.remove(at: position)
  }
  
  private var item: DocumentItemProtocol
  private var items: DocumentItemArrayProtocol
  
  private var position: Int
}
