//
//  SoldState.swift
//  MultiGumballMachine
//
//  Created by User on 02.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import TextStream

class SoldState: StateProtocol {
  init(gumballMachine: MultiGumballMachineContextProtocol, outStream: TextStream.OStream) {
    self.gumballMachine = gumballMachine
    
    self.out = outStream
  }
  
  func insertQuarter() {
    print("Please wait, we're already giving you a gumball", to: &out.stream)
  }
  
  func ejectQuarter() {
    print("Sorry you already turned the crank", to: &out.stream)
  }
  
  func insertGumball() {
    print("Sorry you cannot insert gumball while we're already giving you a gumball", to: &out.stream)
  }
  
  func turnCrank() {
    print("Turning twice doesn't get you another gumball", to: &out.stream)
  }
  
  func dispense() {
    gumballMachine.releaseBall()
    
    if gumballMachine.quarterCount != 0 {
      gumballMachine.setHasQuarterState()
    } else {
      gumballMachine.setNoQuarterState()
    }
    
    if gumballMachine.ballCount == 0 {
      print("Out of gumballs", to: &out.stream)
      
      gumballMachine.setSoldOutState()
    }
  }
  
  func toString() -> String {
    return "delivering a gumball"
  }
  
  private let gumballMachine: MultiGumballMachineContextProtocol
  
  private var out: TextStream.OStream
}
