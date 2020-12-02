//
//  SoldOutState.swift
//  MultiGumballMachine
//
//  Created by User on 02.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import TextStream

class SoldOutState: StateProtocol {
  init(gumballMachine: MultiGumballMachineContextProtocol, outStream: TextStream.OStream) {
    self.gumballMachine = gumballMachine
    
    self.out = outStream
  }
  
  func insertQuarter() {
    print("You can't insert a quarter, the machine is sold out", to: &out.stream)
  }
  
  func ejectQuarter() {
    if gumballMachine.quarterCount != 0 {
      gumballMachine.ejectAllQuarters()
    } else {
      print("You can't eject, you haven't inserted a quarter yet", to: &out.stream)
    }
  }
  
  func turnCrank() {
    print("You turned but there's no gumballs", to: &out.stream)
  }
  
  func dispense() {
    print("No gumball dispensed", to: &out.stream)
  }
  
  func toString() -> String {
    return "sold out"
  }
  
  private let gumballMachine: MultiGumballMachineContextProtocol
  
  private var out: TextStream.OStream
}
