//
//  ReplaceTextCommand.swift
//  DocumentEditor
//
//  Created by User on 29.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class ReplaceTextCommand: CommandProtocol {
  init(text: TextProtocol, newText: TextProtocol) {
    self.prevText = text
    self.nextText = newText
  }
  
  func execute() {
    swapText()
  }
  
  func unexecute() {
    swapText()
  }
  
  func swapText() {
    (prevText.value, nextText.value) = (nextText.value, prevText.value)
  }
  
  private var prevText: TextProtocol
  private var nextText: TextProtocol
}
