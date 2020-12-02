//
//  NaiveMultiGumballMachine.swift
//  MultiGumballMachine
//
//  Created by User on 02.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import TextStream

class NaiveMultiGumballMachine {
  init(numBalls: UInt, outStream: TextStream.OStream) {
    self.state = numBalls > 0 ? .noQuarter : .soldOut
    
    self.ballCount = numBalls
    self.quarterCount = 0
    
    self.out = outStream
  }
  
  let maxQuartersCount: UInt = 5
  
  func insertQuarter() {
    switch state {
      case .noQuarter, .hasQuarter:
        if quarterCount != maxQuartersCount {
          quarterCount += 1
          
          print("You inserted a quarter. Quarters count: \(quarterCount)", to: &out.stream)
          
          if state == .noQuarter {
            state = .hasQuarter
          }
        } else {
          print("You can't insert another quarter. Max count quarters inserted.", to: &out.stream)
      }
      case .soldOut:
        print("You can't insert a quarter, the machine is sold out", to: &out.stream)
      case .sold:
        print("Please wait, we're already giving you a gumball", to: &out.stream)
    }
  }
  
  func ejectQuarter() {
    switch state {
      case .noQuarter:
        print("You haven't inserted a quarter", to: &out.stream)
      case .hasQuarter:
        print("\(quarterCount) quarter\(quarterCount != 1 ? "s" : "") returned", to: &out.stream)
        
        state = .noQuarter
        quarterCount = 0
      case .soldOut:
        if quarterCount != 0 {
          print("\(quarterCount) quarter\(quarterCount != 1 ? "s" : "") returned", to: &out.stream)
          
          quarterCount = 0
        } else {
          print("You can't eject, you haven't inserted a quarter yet", to: &out.stream)
        }
      case .sold:
        print("Sorry you already turned the crank", to: &out.stream)
    }
  }
  
  func turnCrank() {
    switch state {
      case .noQuarter:
        print("You turned but there's no quarter", to: &out.stream)
      case .hasQuarter:
        print("You turned...", to: &out.stream)
      
        state = .sold
      case .soldOut:
        print("You turned but there's no gumballs", to: &out.stream)
      case .sold:
        print("Turning twice doesn't get you another gumball", to: &out.stream)
    }
    
    dispense()
  }
  
  func toString() -> String {
    var stateMessage = ""
    
    switch state {
      case .noQuarter:
        stateMessage = "waiting for quarter"
      case .hasQuarter:
        stateMessage = "waiting for turn of crank"
      case .soldOut:
        stateMessage = "sold out"
      case .sold:
        stateMessage = "delivering a gumball"
    }
    
    return "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: \(ballCount) gumball\(ballCount != 1 ? "s" : "")\nMachine is \(stateMessage)"
    
  }
  
  private func dispense() {
    switch state {
      case .noQuarter:
        print("You need to pay first", to: &out.stream)
      case .hasQuarter, .soldOut:
        print("No gumball dispensed", to: &out.stream)
      case .sold:
        releaseBall()
        
        if quarterCount != 0 {
          state = .hasQuarter
        } else {
          state = .noQuarter
        }
        
        if ballCount == 0 {
          print("Out of gumballs", to: &out.stream)

          state = .soldOut
      }
    }
  }
  
  private func releaseBall() {
    if ballCount != 0 {
      print("A gumball comes rolling out the slot...", to: &out.stream)
      
      ballCount -= 1
      quarterCount -= 1
    }
  }
  
  private var state: State
  
  private var ballCount: UInt
  private var quarterCount: UInt
  
  private let out: TextStream.OStream
}
