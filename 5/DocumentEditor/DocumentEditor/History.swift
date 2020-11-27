//
//  History.swift
//  DocumentEditor
//
//  Created by User on 27.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class History {
  func undo() throws {
    if !canUndo() {
      throw DocumentError.invalidCommand(.invalidArgumentsCount)
    }
    
    position -= 1
    commands[position]!.unexecute()
  }
  
  func redo() throws {
    if !canRedo() {
      throw DocumentError.invalidCommand(.invalidArgumentsCount)
    }
    
    commands[position]!.execute()
    position += 1
  }
  
  func canUndo() -> Bool {
    return position > 0
  }
  
  func canRedo() -> Bool {
    return position != commands.count
  }
  
  func saveAndExecuteCommand(command: CommandProtocol) {
    let capacity = 10
    
    if (commands.count > capacity) {
      position -= 1
      
      commands[0] = nil
      commands.remove(at: 0)
    }
    
    if (position < commands.count) {
      commands.removeLast(commands.count - position)
    }
    
    commands.append(command)
    command.execute()
    
    position += 1
  }
  
  private var commands = [CommandProtocol?]()
  private var position: Int = 0
}
