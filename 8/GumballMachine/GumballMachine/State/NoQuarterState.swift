//
//  NoQuarterState.swift
//  GumballMachine
//
//  Created by User on 01.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import TextStream

class NoQuarterState: StateProtocol {
  init(gumballMachine: GumballMachineContextProtocol, outStream: TextStream.OStream) {
    self.gumballMachine = gumballMachine
    
    self.out = outStream
  }
  
  func insertQuarter() {
    print("You inserted a quarter", to: &out.stream)
    
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
  
  private let gumballMachine: GumballMachineContextProtocol
  
  private var out: TextStream.OStream
}
