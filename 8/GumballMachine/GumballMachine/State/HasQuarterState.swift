//
//  HasQuarterState.swift
//  GumballMachine
//
//  Created by User on 01.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import TextStream

class HasQuarterState: StateProtocol {
  init(gumballMachine: GumballMachineContextProtocol, outStream: TextStream.OStream) {
    self.gumballMachine = gumballMachine
    
    self.out = outStream
  }
  
  func insertQuarter() {
    print("You can't insert another quarter", to: &out.stream)
  }
  
  func ejectQuarter() {
    print("Quarter returned", to: &out.stream)
    
    gumballMachine.setNoQuarterState()
  }
  
  func turnCrank() {
    print("You turned...", to: &out.stream)
    
    gumballMachine.setSoldState()
  }
  
  func dispense() {
    print("No gumball dispensed", to: &out.stream)
  }
  
  func toString() -> String {
    return "waiting for turn of crank"
  }
  
  private let gumballMachine: GumballMachineContextProtocol
  
  private var out: TextStream.OStream
}
