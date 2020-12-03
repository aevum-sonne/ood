//
//  MultiGumballMachineController.swift
//  MultiGumballMachine
//
//  Created by User on 03.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import TextStream

class MultiGumballMachineController {
  init(inStream: TextStream.IStream, outStream: TextStream.OStream) {
    self.input = inStream
    self.out = outStream
    
    self.menu = MultiGumballMachineMenu(inputStream: inStream, outStream: outStream)
    
    menu.addItem(shortcut: "start", description: "start <numGumballs>. Start gumball machine with balls count", command: start)
    menu.addItem(shortcut: "insertQuarter", description: "insertQuarter <quarterCount>. Insert 1 quarter to gumball machine.", command: insertQuarter)
    menu.addItem(shortcut: "ejectQuarter", description: "ejectQuarter. Return all quarters", command: ejectQuarter)
    menu.addItem(shortcut: "insertGumball", description: "insertGumball. Insert 1 gumball to machine.", command: insertGumball)
    menu.addItem(shortcut: "turnCrank", description: "turnCrank. Gives a gumball if quarter in machine.", command: turnCrank)
    menu.addItem(shortcut: "info", description: "info. Gives info about gumball machine", command: toString)
    menu.addItem(shortcut: "help", description: "help. Gives help about gumball machine commands", command: help)

  }
  
  func run() {
    menu.run()
  }
  
  private func start(args: [String]) {
    if gumballMachine == nil {
        if let numBalls = UInt(args.last!), args.count == 2 {
        gumballMachine = MultiGumballMachine(numBalls: numBalls, outStream: out)
      } else {
        print("Invalid balls count argument", to: &out.stream)
      }
    }
  }
  
  private func insertQuarter(args: [String]) {
    if validateCommand(correctArgsCount: 1, argsCount: args.count) {
      gumballMachine?.insertQuarter()
    }
  }
  
  private func ejectQuarter(args: [String]) {
    if validateCommand(correctArgsCount: 1, argsCount: args.count) {
      gumballMachine?.ejectQuarter()
    }
  }
  
  private func insertGumball(args: [String]) {
    if validateCommand(correctArgsCount: 1, argsCount: args.count) {
      gumballMachine?.insertGumball()
    }
  }
  
  private func turnCrank(args: [String]) {
    if validateCommand(correctArgsCount: 1, argsCount: args.count) {
      gumballMachine?.turnCrank()
    }
  }
  
  private func toString(args: [String]) {
    if validateCommand(correctArgsCount: 1, argsCount: args.count) {
      print(gumballMachine!.toString(), to: &out.stream)
    }
  }
  
  private func help(args: [String]) {
    menu.help()
  }
  
  private func validateCommand(correctArgsCount: Int, argsCount: Int) -> Bool {
    if gumballMachine == nil {
      print("Gumball machine isn't started yet.", to: &out.stream)
      
      return false
    } else if correctArgsCount != argsCount {
      print("Invalid arguments count.", to: &out.stream)
      
      return false
    }
    
    return true
  }
  
  
  private let out: TextStream.OStream
  private let input: TextStream.IStream
  
  private let menu: MultiGumballMachineMenu
  
  private var gumballMachine: MultiGumballMachine?
}
