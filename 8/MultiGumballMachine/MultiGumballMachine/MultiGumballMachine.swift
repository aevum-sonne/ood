//
//  MultiGumballMachine.swift
//  MultiGumballMachine
//
//  Created by User on 02.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import TextStream

fileprivate class MultiGumballMachineContext: MultiGumballMachineContextProtocol {
  init(numBalls: UInt, outStream: TextStream.OStream) {
    self.ballCount = numBalls
    self.quarterCount = 0
    
    self.out = outStream
    
    self.soldState = SoldState(gumballMachine: self, outStream: outStream)
    self.soldOutState = SoldOutState(gumballMachine: self, outStream: outStream)
    self.noQuarterState = NoQuarterState(gumballMachine: self, outStream: outStream)
    self.hasQuarterState = HasQuarterState(gumballMachine: self, outStream: outStream)
    
    self.state = ballCount > 0 ? noQuarterState : soldOutState
  }
    
  private(set) var ballCount: UInt
  
  private(set) var quarterCount: UInt
  
  let maxQuarterCount: UInt = 5
  
  func insertQuarter() {
    state!.insertQuarter()
  }
  
  func addQuarter() {
    if quarterCount == maxQuarterCount {
      print("You can't insert another quarter. Max count quarters inserted.", to: &out.stream)
    } else {
      quarterCount += 1
      
      print("You inserted a quarter. Quarters count: \(quarterCount)", to: &out.stream)
    }
  }
  
  func ejectQuarter() {
    state!.ejectQuarter()
  }
  
  func ejectAllQuarters() {
    print("\(quarterCount) quarter\(quarterCount != 1 ? "s" : "") returned", to: &out.stream)
    
    quarterCount = 0
  }
  
  func turnCrank() {
    state!.turnCrank()
    state!.dispense()
  }
  
  func toString() -> String {
    return "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: \(ballCount) gumball\(ballCount != 1 ? "s" : "")\nMachine is \(state!.toString())"
  }
  
  func releaseBall() {
    if ballCount != 0 {
      print("A gumball comes rolling out the slot...", to: &out.stream)
      
      ballCount -= 1
      quarterCount -= 1
    }
  }
  
  func setSoldOutState() {
    state = soldOutState
  }
  
  func setNoQuarterState() {
    state = noQuarterState
  }
  
  func setSoldState() {
    state = soldState
  }
  
  func setHasQuarterState() {
    state = hasQuarterState
  }
  
  private var out: TextStream.OStream
  
  private var soldState: StateProtocol?
  private var soldOutState: StateProtocol?
  private var noQuarterState: StateProtocol?
  private var hasQuarterState: StateProtocol?
  
  private var state: StateProtocol?
}

class MultiGumballMachine: MultiGumballMachineProtocol {
  init(numBalls: UInt, outStream: TextStream.OStream) {
    self.gumballMachineContext = MultiGumballMachineContext(numBalls: numBalls, outStream: outStream)
  }
  
  func ejectQuarter() {
    gumballMachineContext.ejectQuarter()
  }
  
  func insertQuarter() {
    gumballMachineContext.insertQuarter()
  }
  
  func turnCrank() {
    gumballMachineContext.turnCrank()
  }
  
  func toString() -> String {
    return gumballMachineContext.toString()
  }
  
  private let gumballMachineContext: MultiGumballMachineContext
}
