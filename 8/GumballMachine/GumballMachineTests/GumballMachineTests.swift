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
  
  
  // MARK: NoQuarterState tests
  
  func testCorrectNoQuarterStateNoChangeIfInsertQuarterNotCalled() {
    let expectedInfo = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 5 gumballs\nMachine is waiting for quarter"
    let expectedMessage = "You need to pay first"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 5, outStream: outStream)
        
    gumballMachine.ejectQuarter()
    gumballMachine.turnCrank()
            
    XCTAssertEqual(expectedInfo, gumballMachine.toString())
    XCTAssertEqual(expectedMessage, outStream.lastLog)
  }
  
  func testCorrectNoQuarterStateInsertAndInjectQuarter() {
    let expectedInfo = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 5 gumballs\nMachine is waiting for quarter"
    let expectedMessage = "Quarter returned"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 5, outStream: outStream)
    
    gumballMachine.insertQuarter()
    gumballMachine.ejectQuarter()
        
    XCTAssertEqual(expectedInfo, gumballMachine.toString())
    XCTAssertEqual(expectedMessage, outStream.lastLog)
  }
  
  func testCorrectNoQuarterStateChangeIfInsertQuarterCalled() {
    let expectedInfo = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 5 gumballs\nMachine is waiting for turn of crank"
    let expectedMessage = "You inserted a quarter"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 5, outStream: outStream)
    
    gumballMachine.ejectQuarter()
    gumballMachine.turnCrank()
    gumballMachine.insertQuarter()
            
    XCTAssertEqual(expectedInfo, gumballMachine.toString())
    XCTAssertEqual(expectedMessage, outStream.lastLog)
  }
  
  
  // MARK: HasQuarterState
  
  func testCorrectSetHasQuarterStateWhenInsertQuarter() {
    let expectedInfo = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 5 gumballs\nMachine is waiting for turn of crank"
    let expectedMessage = "You inserted a quarter"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 5, outStream: outStream)
        
    gumballMachine.insertQuarter()
        
    XCTAssertEqual(expectedInfo, gumballMachine.toString())
    XCTAssertEqual(expectedMessage, outStream.lastLog)
  }
  
  func testCorrectHasQuarterStateNoChangeIfInsertAnotherQuarter() {
    let expectedInfo = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 5 gumballs\nMachine is waiting for turn of crank"
    let expectedMessage = "You can\'t insert another quarter"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 5, outStream: outStream)
        
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    
    XCTAssertEqual(expectedInfo, gumballMachine.toString())
    XCTAssertEqual(expectedMessage, outStream.lastLog)
  }
  
  func testCorrectChangingHasQuarterStateWhenInsertQuarter() {
    let expectedInfo = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 5 gumballs\nMachine is waiting for turn of crank"
    let expectedMessage = "A gumball comes rolling out the slot..."
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 5, outStream: outStream)
        
    gumballMachine.insertQuarter()
    gumballMachine.turnCrank()
            
    XCTAssertNotEqual(expectedInfo, gumballMachine.toString())
    XCTAssertEqual(expectedMessage, outStream.lastLog)
  }
  
  
  // MARK: SoldState tests
  
  func testCorrectSoldStateBuyGum() {
    let expectedInfo = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 1 gumballs\nMachine is waiting for turn of crank"
    let expectedMessage = "A gumball comes rolling out the slot..."
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 2, outStream: outStream)

    GumballMachineActions.buyGum(gumballMachine: gumballMachine)
    
    XCTAssertNotEqual(expectedInfo, gumballMachine.toString())
    XCTAssertEqual(expectedMessage, outStream.lastLog)
  }
  
  func testCorrectSoldStateChangingAfterTurnCrack() {
    let expectedInfo = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 1 gumballs\nMachine is waiting for turn of crank"
    let expectedMessage = "You need to pay first"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 2, outStream: outStream)

    GumballMachineActions.buyGum(gumballMachine: gumballMachine)
    gumballMachine.turnCrank()
    
    XCTAssertNotEqual(expectedInfo, gumballMachine.toString())
    XCTAssertEqual(expectedMessage, outStream.lastLog)
  }
  
  
  // MARK: SoldOutState tests
  
  func testCorrectSoldOutStateWhenNumBallsEqualsToZero() {
    let expectedInfo = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 0 gumballs\nMachine is sold out"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 0, outStream: outStream)
    
    XCTAssertEqual(expectedInfo, gumballMachine.toString())
  }
  
  func testRecieveMessageSoldOutIfMachineIsEmptyOnQuarterInserting() {
    let expectedMessage = "You can\'t insert a quarter, the machine is sold out"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 0, outStream: outStream)
    
    gumballMachine.insertQuarter()
    
    XCTAssertEqual(expectedMessage, outStream.lastLog)
  }
  
  func testBuyAllGumsAndRecieveMessageSoldOut() {
    let expectedMessage = "You can\'t insert a quarter, the machine is sold out"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 5, outStream: outStream)
    
    GumballMachineActions.buyGum(gumballMachine: gumballMachine)
    GumballMachineActions.buyGum(gumballMachine: gumballMachine)
    GumballMachineActions.buyGum(gumballMachine: gumballMachine)
    GumballMachineActions.buyGum(gumballMachine: gumballMachine)
    GumballMachineActions.buyGum(gumballMachine: gumballMachine)
    
    gumballMachine.insertQuarter()
    
    XCTAssertEqual(expectedMessage, outStream.lastLog)
  }
  
  func testCorrectSoldOutStateAfterEjecting() {
    let expectedInfo = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 0 gumballs\nMachine is sold out"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 0, outStream: outStream)
    
    gumballMachine.ejectQuarter()
    
    XCTAssertEqual(expectedInfo, gumballMachine.toString())
  }
  
  func testCorrectSoldOutStateAfterInserting() {
    let expectedInfo = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 0 gumballs\nMachine is sold out"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 0, outStream: outStream)
    
    gumballMachine.insertQuarter()
    
    XCTAssertEqual(expectedInfo, gumballMachine.toString())
  }
  
  func testCorrectSoldOutStateAfterTurningCrank() {
    let expectedInfo = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 0 gumballs\nMachine is sold out"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = GumballMachine(numBalls: 0, outStream: outStream)
    
    gumballMachine.turnCrank()
    
    XCTAssertEqual(expectedInfo, gumballMachine.toString())
  }
}
