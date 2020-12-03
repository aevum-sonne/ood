//
//  MultiGumballMachineMenu.swift
//  MultiGumballMachine
//
//  Created by User on 03.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import TextStream

typealias GumballCommand = ([String]) -> Void

fileprivate class MultiGumballMachineMenuItem {
  let shortcut: String
  let description: String
  
  let command: GumballCommand
  
  init(shortcut: String, description: String, command: @escaping GumballCommand) {
    self.shortcut = shortcut
    self.description = description
    
    self.command = command
  }
}

class MultiGumballMachineMenu {
  init(inputStream: TextStream.IStream, outStream: TextStream.OStream) {
    self.input = inputStream
    self.out = outStream
    
    self.items = [MultiGumballMachineMenuItem]()
  }
  
  func addItem(shortcut: String, description: String, command: @escaping GumballCommand) {
    items.append(MultiGumballMachineMenuItem(shortcut: shortcut, description: description, command: command))
  }
  
  func help() {
    print("Available commands:", to: &out.stream)
    
    for item in items {
      print("\t\(item.shortcut): \(item.description)", to: &out.stream)
    }
  }
  
  func run() {
    print("To start machine type command: start <numGumballs>", to: &out.stream)
    print("Type \"quit\" to terminate program", terminator: "\n\n\n", to: &out.stream)
    
    while let command = input.stream.read() {
      let args = command.split { $0 == " " }.map { String($0) }
      
      if (args.first?.lowercased() == "quit") {
        
        break
      }
      
      execute(args: args)
    }
  }
  
  private func execute(args: [String]) {
    if args.isEmpty {
      print("No arguments were specified.", to: &out.stream)
      
      return
    }
    
    if let item = items.first(where: { $0.shortcut.lowercased() == args[0].lowercased() }) {
      item.command(args)
    }
  }
  
  private let input: TextStream.IStream
  private let out: TextStream.OStream
  
  private var items: [MultiGumballMachineMenuItem]
}
