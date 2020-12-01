//
//  SoldState.swift
//  GumballMachine
//
//  Created by User on 01.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import TextStream

class SoldState: StateProtocol {
  init(gumballMachine: GumballMachineContextProtocol, outStream: TextStream.OStream) {
    self.gumballMachine = gumballMachine
    
    self.out = outStream
  }
  
  func insertQuarter() {
    print("Please wait, we're already giving you a gumball", to: &out.stream)
  }
  
  func ejectQuarter() {
    print("Sorry you already turned the crank", to: &out.stream)
  }
  
  func turnCrank() {
    print("Turning twice doesn't get you another gumball", to: &out.stream)
  }
  
  func dispense() {
    gumballMachine.releaseBall()
    
    if gumballMachine.ballCount == 0 {
      print("Out of gumballs", to: &out.stream)
      
      gumballMachine.setSoldOutState()
    } else {
      gumballMachine.setNoQuarterState()
    }
  }
  
  func toString() -> String {
    return "delivering a gumball"
  }
  
  private let gumballMachine: GumballMachineContextProtocol
  
  private var out: TextStream.OStream
}
