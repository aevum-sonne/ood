//
//  NoQuarterState.swift
//  MultiGumballMachine
//
//  Created by User on 02.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import TextStream

class NoQuarterState: StateProtocol {
  init(gumballMachine: MultiGumballMachineContextProtocol, outStream: TextStream.OStream) {
    self.gumballMachine = gumballMachine
    
    self.out = outStream
  }
  
  func insertQuarter() {
    gumballMachine.addQuarter()
    gumballMachine.setHasQuarterState()
  }
  
  func ejectQuarter() {
    print("You haven't inserted a quarter", to: &out.stream)
  }
  
  func turnCrank() {
    print("You turned but there's no quarter", to: &out.stream)
  }
  
  func dispense() {
    print("You need to pay first", to: &out.stream)
  }
  
  func toString() -> String {
    return "waiting for quarter"
  }
  
  private let gumballMachine: MultiGumballMachineContextProtocol
  
  private var out: TextStream.OStream
}
