//
//  GumballMachineTests.swift
//  GumballMachineTests
//
//  Created by User on 01.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

@testable import GumballMachine

import XCTest
import TextStream



class GumballMachineTests: XCTestCase {
  
  // MARK: SoldOutState tests
  
  func testCorrectSoldOutStateWhenNumBallsEqualsToZero() {
    let expected = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 0 gumballs\nMachine is sold out"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 0, outStream: outStream)
    
    XCTAssertEqual(expected, gumballMachine.toString())
  }
  
  func testRecieveMessageSoldOutIfMachineIsEmptyOnQuarterInserting() {
    let expected = "You can\'t insert a quarter, the machine is sold out\n"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 0, outStream: outStream)
    
    gumballMachine.insertQuarter()
    
    XCTAssertEqual(expected, outStream.logs)
  }
  
  func testBuyAllGumsAndRecieveMessageSoldOut() {
    let expected = "You can\'t insert a quarter, the machine is sold out"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 5, outStream: outStream)
    
    GumballMachineActions.buyGum(gumballMachine: gumballMachine)
    GumballMachineActions.buyGum(gumballMachine: gumballMachine)
    GumballMachineActions.buyGum(gumballMachine: gumballMachine)
    GumballMachineActions.buyGum(gumballMachine: gumballMachine)
    GumballMachineActions.buyGum(gumballMachine: gumballMachine)
    
    gumballMachine.insertQuarter()
    
    XCTAssertEqual(expected, outStream.lastLog)
  }
  
  func testCorrectSoldOutStateAfterEjecting() {
    let expected = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 0 gumballs\nMachine is sold out"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 0, outStream: outStream)
    
    gumballMachine.ejectQuarter()
    
    XCTAssertEqual(expected, gumballMachine.toString())
  }
  
  func testCorrectSoldOutStateAfterInserting() {
    let expected = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 0 gumballs\nMachine is sold out"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 0, outStream: outStream)
    
    gumballMachine.insertQuarter()
    
    XCTAssertEqual(expected, gumballMachine.toString())
  }
  
  func testCorrectSoldOutStateAfterTurningCrank() {
    let expected = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 0 gumballs\nMachine is sold out"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 0, outStream: outStream)
    
    gumballMachine.turnCrank()
    
    XCTAssertEqual(expected, gumballMachine.toString())
  }
  
  
  // MARK: SoldState test
  
  func testCorrectSoldStateBuyGum() {
    let expected = "A gumball comes rolling out the slot..."
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 2, outStream: outStream)

    GumballMachineActions.buyGum(gumballMachine: gumballMachine)
    
    XCTAssertEqual(expected, outStream.lastLog)
  }
  
  func testCorrectSoldStateChangingAfterTurnCrack() {
    let expected = "You need to pay first"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 2, outStream: outStream)

    GumballMachineActions.buyGum(gumballMachine: gumballMachine)
    gumballMachine.turnCrank()
    
    XCTAssertEqual(expected, outStream.lastLog)
  }

}
