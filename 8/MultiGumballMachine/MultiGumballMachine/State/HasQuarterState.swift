//
//  HasQuarterState.swift
//  MultiGumballMachine
//
//  Created by User on 02.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import TextStream

class HasQuarterState: StateProtocol {
  init(gumballMachine: MultiGumballMachineContextProtocol, outStream: TextStream.OStream) {
    self.gumballMachine = gumballMachine
    
    self.out = outStream
  }
  
  func insertQuarter() {
    gumballMachine.addQuarter()
  }
  
  func ejectQuarter() {
    gumballMachine.ejectAllQuarters()
    gumballMachine.setNoQuarterState()
  }
  
  func insertGumball() {
    gumballMachine.addGumball()
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
  
  private let gumballMachine: MultiGumballMachineContextProtocol
  
  private var out: TextStream.OStream
}
