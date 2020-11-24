//
//  Menu.swift
//  DocumentEditor
//
//  Created by User on 26.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

typealias CommandType = ([String]) throws -> Void

fileprivate class Item {
  let shortcut: String
  let description: String
  
  let command: CommandType
  
  init(shortcut: String, description: String, command: @escaping CommandType) {
    self.shortcut = shortcut
    self.description = description
    
    self.command = command
  }
}

class Menu {
  func addItem(shortcut: String, description: String, command: @escaping CommandType) {
    items.append(Item(shortcut: shortcut, description: description, command: command))
  }
  
  func help() {
    print("Available commands:")
    
    for item in items {
      print("\t\(item.shortcut): \(item.description)")
    }
  }
  
  func run() {
    while let command = readLine() {
      do {
        let args = command.split { $0 == " " }.map { String($0) }
        
        if (args.first?.lowercased() == "quit") {
          break
        }
        
        try execute(args: args)
      } catch let error {
        print(error.localizedDescription)
      }
    }
  }
  
  private func execute(args: [String]) throws {
    if args.isEmpty {
      throw DocumentError.invalidCommand(.invalidArgumentsCount)
    }
    
    if let item = items.first(where: { $0.shortcut.lowercased() == args[0].lowercased() }) {
      do {
        try item.command(args)
      } catch let error {
        throw error
      }
    } else {
      throw DocumentError.invalidCommand(.unknownCommand)
    }
  }
  
  private var items = [Item]()
}
