//
//  Paragraph.swift
//  DocumentEditor
//
//  Created by User on 27.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class Paragraph: ParagraphProtocol {
  var value: String {
    return text.value
  }
  
  init(text: TextProtocol, history: History) {
    self.text = text
    
    self.history = history
  }
  
  func setText(value: String) {
    let newText = Text(value: value)
    
    history.saveAndExecuteCommand(command: ReplaceTextCommand(text: text, newText: newText))
  }
  
  private let text: TextProtocol
  private let history: History
}
