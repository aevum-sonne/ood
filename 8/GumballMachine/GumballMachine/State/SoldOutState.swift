//
//  SoldOutState.swift
//  GumballMachine
//
//  Created by User on 01.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import TextStream

class SoldOutState: StateProtocol {
  init(gumballMachine: GumballMachineContextProtocol, outStream: TextStream.OStream) {
    self.gumballMachine = gumballMachine
    
    self.out = outStream
  }
  
  func insertQuarter() {
    print("You can't insert a quarter, the machine is sold out", to: &out.stream)
  }
  
  func ejectQuarter() {
    print("You can't eject, you haven't inserted a quarter yet", to: &out.stream)
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
  
  private let gumballMachine: GumballMachineContextProtocol
  
  private var out: TextStream.OStream
}
