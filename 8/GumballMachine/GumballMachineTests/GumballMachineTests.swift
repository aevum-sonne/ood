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
  
  override class func setUp() {
    outStream = TextStream.OStream(type: .logs)
  }
  
  fileprivate static var outStream = TextStream.OStream(type: .logs)

  
  // MARK: NoQuarterState tests
  
  func testCorrectNoQuarterStateNoChangeIfInsertQuarterNotCalled() {
    let expected = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 5 gumballs\nMachine is waiting for quarter"
    
    let gumballMachine = GumballMachine(numBalls: 5, outStream: GumballMachineTests.outStream)
        
    gumballMachine.ejectQuarter()
    gumballMachine.turnCrank()
        
    XCTAssertEqual(expected, gumballMachine.toString())
  }
  
  func testCorrectNoQuarterStateInsertAndInjectQuarter() {
    let expected = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 5 gumballs\nMachine is waiting for quarter"
    
    let gumballMachine = GumballMachine(numBalls: 5, outStream: GumballMachineTests.outStream)
    
    gumballMachine.insertQuarter()
    gumballMachine.ejectQuarter()
    
    XCTAssertEqual(expected, gumballMachine.toString())
  }
  
  func testCorrectNoQuarterStateChangeIfInsertQuarterCalled() {
    let expected = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 5 gumballs\nMachine is waiting for turn of crank"
    
    let gumballMachine = GumballMachine(numBalls: 5, outStream: GumballMachineTests.outStream)
    
    gumballMachine.ejectQuarter()
    gumballMachine.turnCrank()
    gumballMachine.insertQuarter()
        
    XCTAssertEqual(expected, gumballMachine.toString())
  }
  
  
  // MARK: HasQuarterState
  
  func testCorrectSetHasQuarterStateWhenInsertQuarter() {
    let expected = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 5 gumballs\nMachine is waiting for turn of crank"
    
    let gumballMachine = GumballMachine(numBalls: 5, outStream: GumballMachineTests.outStream)
        
    gumballMachine.insertQuarter()
        
    XCTAssertEqual(expected, gumballMachine.toString())
  }
  
  func testCorrectHasQuarterStateNoChangeIfInsertAnotherQuarter() {
    let expected = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 5 gumballs\nMachine is waiting for turn of crank"
    
    let gumballMachine = GumballMachine(numBalls: 5, outStream: GumballMachineTests.outStream)
        
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    
    XCTAssertEqual(expected, gumballMachine.toString())
    
    let expectedMessage = "You can\'t insert another quarter"
    
    XCTAssertEqual(expectedMessage, GumballMachineTests.outStream.lastLog)
  }
  
  func testCorrectChangingHasQuarterStateWhenInsertQuarter() {
    let expected = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 5 gumballs\nMachine is waiting for turn of crank"
    
    let gumballMachine = GumballMachine(numBalls: 5, outStream: GumballMachineTests.outStream)
        
    gumballMachine.insertQuarter()
    gumballMachine.turnCrank()
    
    XCTAssertNotEqual(expected, gumballMachine.toString())
  }
  
  // MARK: SoldState tests
  
  func testCorrectSoldStateBuyGum() {
    let expected = "A gumball comes rolling out the slot..."
    
    let gumballMachine = GumballMachine(numBalls: 2, outStream: GumballMachineTests.outStream)

    GumballMachineActions.buyGum(gumballMachine: gumballMachine)
    
    XCTAssertEqual(expected, GumballMachineTests.outStream.lastLog)
  }
  
  func testCorrectSoldStateChangingAfterTurnCrack() {
    let expected = "You need to pay first"
    
    let gumballMachine = GumballMachine(numBalls: 2, outStream: GumballMachineTests.outStream)

    GumballMachineActions.buyGum(gumballMachine: gumballMachine)
    gumballMachine.turnCrank()
    
    XCTAssertEqual(expected, GumballMachineTests.outStream.lastLog)
  }
}


// MARK: SoldOutState tests

func testCorrectSoldOutStateWhenNumBallsEqualsToZero() {
  let expected = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 0 gumballs\nMachine is sold out"
  
  let gumballMachine = GumballMachine(numBalls: 0, outStream: GumballMachineTests.outStream)
  
  XCTAssertEqual(expected, gumballMachine.toString())
}

func testRecieveMessageSoldOutIfMachineIsEmptyOnQuarterInserting() {
  let expected = "You can\'t insert a quarter, the machine is sold out\n"
  
  let gumballMachine = GumballMachine(numBalls: 0, outStream: GumballMachineTests.outStream)
  
  gumballMachine.insertQuarter()
  
  XCTAssertEqual(expected, GumballMachineTests.outStream.logs)
}

func testBuyAllGumsAndRecieveMessageSoldOut() {
  let expected = "You can\'t insert a quarter, the machine is sold out"
  
  let gumballMachine = GumballMachine(numBalls: 5, outStream: GumballMachineTests.outStream)
  
  GumballMachineActions.buyGum(gumballMachine: gumballMachine)
  GumballMachineActions.buyGum(gumballMachine: gumballMachine)
  GumballMachineActions.buyGum(gumballMachine: gumballMachine)
  GumballMachineActions.buyGum(gumballMachine: gumballMachine)
  GumballMachineActions.buyGum(gumballMachine: gumballMachine)
  
  gumballMachine.insertQuarter()
  
  XCTAssertEqual(expected, GumballMachineTests.outStream.lastLog)
}

func testCorrectSoldOutStateAfterEjecting() {
  let expected = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 0 gumballs\nMachine is sold out"
  
  let gumballMachine = GumballMachine(numBalls: 0, outStream: GumballMachineTests.outStream)
  
  gumballMachine.ejectQuarter()
  
  XCTAssertEqual(expected, gumballMachine.toString())
}

func testCorrectSoldOutStateAfterInserting() {
  let expected = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 0 gumballs\nMachine is sold out"
  
  let gumballMachine = GumballMachine(numBalls: 0, outStream: GumballMachineTests.outStream)
  
  gumballMachine.insertQuarter()
  
  XCTAssertEqual(expected, gumballMachine.toString())
}

func testCorrectSoldOutStateAfterTurningCrank() {
  let expected = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 0 gumballs\nMachine is sold out"
  
  let gumballMachine = GumballMachine(numBalls: 0, outStream: GumballMachineTests.outStream)
  
  gumballMachine.turnCrank()
  
  XCTAssertEqual(expected, gumballMachine.toString())
}
