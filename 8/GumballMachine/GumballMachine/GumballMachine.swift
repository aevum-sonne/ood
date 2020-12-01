//
//  GumballMachine.swift
//  GumballMachine
//
//  Created by User on 01.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import TextStream

fileprivate class GumballMachineContext: GumballMachineContextProtocol {
  init(numBalls: UInt, outStream: TextStream.OStream) {
    self.ballCount = numBalls
    
    self.out = outStream
    
    self.soldState = SoldState(gumballMachine: self, outStream: outStream)
    self.soldOutState = SoldOutState(gumballMachine: self, outStream: outStream)
    self.noQuarterState = NoQuarterState(gumballMachine: self, outStream: outStream)
    self.hasQuarterState = HasQuarterState(gumballMachine: self, outStream: outStream)
    
    self.state = ballCount > 0 ? noQuarterState : soldOutState
  }
  
  private(set) var ballCount: UInt
  
  func ejectQuarter() {
    state!.ejectQuarter()
  }
  
  func insertQuarter() {
    state!.insertQuarter()
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

public class GumballMachine {
  init(numBalls: UInt, outStream: TextStream.OStream) {
    self.context = GumballMachineContext(numBalls: numBalls, outStream: outStream)
  }
  
  func ejectQuarter() {
    context.ejectQuarter()
  }
  
  func insertQuarter() {
    context.insertQuarter()
  }
  
  func turnCrank() {
    context.turnCrank()
  }
  
  func toString() -> String {
    return context.toString()
  }
  
  private let context: GumballMachineContext
}
