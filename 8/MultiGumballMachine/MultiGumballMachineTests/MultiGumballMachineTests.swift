//
//  MultiGumballMachineTests.swift
//  MultiGumballMachineTests
//
//  Created by User on 02.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

@testable import MultiGumballMachine

import XCTest
import TextStream

class MultiGumballMachineTests: XCTestCase {
  
  
  // MARK: NoQuarterState tests
  
  func testCorrectNoQuarterStateMessageToString() {
    let expectedInfo = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 5 gumballs\nMachine is waiting for quarter"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = MultiGumballMachine(numBalls: 5, outStream: outStream)
    
    let naiveOutStream = TextStream.OStream(type: .logs)
    let naiveMachine = NaiveMultiGumballMachine(numBalls: 5, outStream: naiveOutStream)
            
    XCTAssertEqual(expectedInfo, gumballMachine.toString())
    XCTAssertEqual(expectedInfo, naiveMachine.toString())
  }
  
  func testCorrectNoQuarterStateMessageWhenEject() {
    let expectedMessage = "You haven\'t inserted a quarter"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = MultiGumballMachine(numBalls: 5, outStream: outStream)
    
    let naiveOutStream = TextStream.OStream(type: .logs)
    let naiveMachine = NaiveMultiGumballMachine(numBalls: 5, outStream: naiveOutStream)
    
    gumballMachine.ejectQuarter()
    naiveMachine.ejectQuarter()
    
    XCTAssertEqual(expectedMessage, outStream.lastLog)
    XCTAssertEqual(expectedMessage, naiveOutStream.lastLog)
  }
  
  func testCorrectNoQuarterStateMessageWhenInsertQuarter() {
    let expectedMessage = "You inserted a quarter. Quarters count: 1"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = MultiGumballMachine(numBalls: 5, outStream: outStream)
    
    let naiveOutStream = TextStream.OStream(type: .logs)
    let naiveMachine = NaiveMultiGumballMachine(numBalls: 5, outStream: naiveOutStream)
    
    gumballMachine.insertQuarter()
    naiveMachine.insertQuarter()
    
    XCTAssertEqual(expectedMessage, outStream.lastLog)
    XCTAssertEqual(expectedMessage, naiveOutStream.lastLog)
  }
  
  func testCorrectNoQuarterStateMessageWhenTurnCrank() {
    let expectedMessage = "You need to pay first"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = MultiGumballMachine(numBalls: 5, outStream: outStream)
    
    let naiveOutStream = TextStream.OStream(type: .logs)
    let naiveMachine = NaiveMultiGumballMachine(numBalls: 5, outStream: naiveOutStream)
    
    gumballMachine.turnCrank()
    naiveMachine.turnCrank()
    
    XCTAssertEqual(expectedMessage, outStream.lastLog)
    XCTAssertEqual(expectedMessage, naiveOutStream.lastLog)
  }
  
  func testCorrectNoQuarterStateInsertGumball() {
    let expectedMessage = "Gumball inserted. Gumball count: 6"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = MultiGumballMachine(numBalls: 5, outStream: outStream)
    
    gumballMachine.insertGumball()
    
    XCTAssertEqual(expectedMessage, outStream.lastLog)
  }
  
  
  // MARK: HasQuarterState tests
  
  func testCorrectHasQuarterStateMessageToStringInsertOnce() {
    let expectedInfo = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 5 gumballs\nMachine is waiting for turn of crank"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = MultiGumballMachine(numBalls: 5, outStream: outStream)
    
    let naiveOutStream = TextStream.OStream(type: .logs)
    let naiveMachine = NaiveMultiGumballMachine(numBalls: 5, outStream: naiveOutStream)
    
    gumballMachine.insertQuarter()
    naiveMachine.insertQuarter()
            
    XCTAssertEqual(expectedInfo, gumballMachine.toString())
    XCTAssertEqual(expectedInfo, naiveMachine.toString())
  }
  
  func testCorrectHasQuarterStateMessageToStringInsertMaxCount() {
    let expectedInfo = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 5 gumballs\nMachine is waiting for turn of crank"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = MultiGumballMachine(numBalls: 5, outStream: outStream)
    
    let naiveOutStream = TextStream.OStream(type: .logs)
    let naiveMachine = NaiveMultiGumballMachine(numBalls: 5, outStream: naiveOutStream)
    
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
            
    XCTAssertEqual(expectedInfo, gumballMachine.toString())
    XCTAssertEqual(expectedInfo, naiveMachine.toString())
  }
  
  func testCorrectHasQuarterStateMessageToStringInsertOverMaxCount() {
    let expectedInfo = "Mighty Gumball, Inc.\nSwift-enabled Standing Gumball Model #2020 (with state)\nInventory: 5 gumballs\nMachine is waiting for turn of crank"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = MultiGumballMachine(numBalls: 5, outStream: outStream)
    
    let naiveOutStream = TextStream.OStream(type: .logs)
    let naiveMachine = NaiveMultiGumballMachine(numBalls: 5, outStream: naiveOutStream)
    
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
            
    XCTAssertEqual(expectedInfo, gumballMachine.toString())
    XCTAssertEqual(expectedInfo, naiveMachine.toString())
  }
  
  func testCorrectHasQuarterStateMessageWhenEjectOnce() {
    let expectedMessage = "1 quarter returned"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = MultiGumballMachine(numBalls: 5, outStream: outStream)
    
    let naiveOutStream = TextStream.OStream(type: .logs)
    let naiveMachine = NaiveMultiGumballMachine(numBalls: 5, outStream: naiveOutStream)
    
    gumballMachine.insertQuarter()
    gumballMachine.ejectQuarter()
    
    naiveMachine.insertQuarter()
    naiveMachine.ejectQuarter()
    
    XCTAssertEqual(expectedMessage, outStream.lastLog)
    XCTAssertEqual(expectedMessage, naiveOutStream.lastLog)
  }
  
  func testCorrectHasQuarterStateMessageWhenEjectMaxCount() {
    let expectedOut = "You inserted a quarter. Quarters count: 1\nYou inserted a quarter. Quarters count: 2\nYou inserted a quarter. Quarters count: 3\nYou inserted a quarter. Quarters count: 4\nYou inserted a quarter. Quarters count: 5\n5 quarters returned\nYou haven\'t inserted a quarter\n"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = MultiGumballMachine(numBalls: 5, outStream: outStream)
    
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()

    gumballMachine.ejectQuarter()
    gumballMachine.ejectQuarter()
    
    let naiveOutStream = TextStream.OStream(type: .logs)
    let naiveMachine = NaiveMultiGumballMachine(numBalls: 5, outStream: naiveOutStream)
    
    XCTAssertEqual(expectedOut, outStream.logs)
    
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
    
    naiveMachine.ejectQuarter()
    naiveMachine.ejectQuarter()
    
    XCTAssertEqual(expectedOut, naiveOutStream.logs)
  }
  
  func testCorrectHasQuarterStateMessageWhenInsertingExtraQuarters() {
    let expectedOut = "You inserted a quarter. Quarters count: 1\nYou inserted a quarter. Quarters count: 2\n2 quarters returned\nYou inserted a quarter. Quarters count: 1\nYou inserted a quarter. Quarters count: 2\nYou inserted a quarter. Quarters count: 3\n3 quarters returned\n"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = MultiGumballMachine(numBalls: 5, outStream: outStream)
    
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.ejectQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()

    gumballMachine.ejectQuarter()
    
    XCTAssertEqual(expectedOut, outStream.logs)
    
    let naiveOutStream = TextStream.OStream(type: .logs)
    let naiveMachine = NaiveMultiGumballMachine(numBalls: 5, outStream: naiveOutStream)
    
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
    naiveMachine.ejectQuarter()
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
    
    naiveMachine.ejectQuarter()
    
    XCTAssertEqual(expectedOut, naiveOutStream.logs)
  }
  
  func testHasQuarterStateCorrectMessageOnEjectionWhenQuartersCountMoreThenGumballsCount() {
    let expectedMessage = "2 quarters returned"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = MultiGumballMachine(numBalls: 3, outStream: outStream)
    
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    
    gumballMachine.turnCrank()
    gumballMachine.turnCrank()
    gumballMachine.turnCrank()
    gumballMachine.turnCrank()
    gumballMachine.turnCrank()
    
    gumballMachine.ejectQuarter()
    
    XCTAssertEqual(expectedMessage, outStream.lastLog)
    
    let naiveOutStream = TextStream.OStream(type: .logs)
    let naiveMachine = NaiveMultiGumballMachine(numBalls: 3, outStream: naiveOutStream)
    
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
    
    naiveMachine.turnCrank()
    naiveMachine.turnCrank()
    naiveMachine.turnCrank()
    naiveMachine.turnCrank()
    naiveMachine.turnCrank()
    
    naiveMachine.ejectQuarter()
    
    XCTAssertEqual(expectedMessage, naiveOutStream.lastLog)
  }
  
  func testCorrectHasQuarterStateMessageWhenTurnCrank() {
    let expectedMessage = "You need to pay first"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = MultiGumballMachine(numBalls: 5, outStream: outStream)
    
    gumballMachine.turnCrank()
    
    XCTAssertEqual(expectedMessage, outStream.lastLog)
    
    let naiveOutStream = TextStream.OStream(type: .logs)
    let naiveMachine = NaiveMultiGumballMachine(numBalls: 5, outStream: naiveOutStream)
    
    naiveMachine.turnCrank()
    
    XCTAssertEqual(expectedMessage, naiveOutStream.lastLog)
  }
  
  func testCorrectHasQuarterStateInsertGumball() {
    let expectedMessage = "Gumball inserted. Gumball count: 6"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = MultiGumballMachine(numBalls: 5, outStream: outStream)
    
    gumballMachine.insertQuarter()
    gumballMachine.insertGumball()
    
    XCTAssertEqual(expectedMessage, outStream.lastLog)
  }
  
  
  // MARK: SoldOutState tests
  
  func testCorrectSoldOutStateEjectQuarterIfQuarterInMachine() {
    let expectedMessage = "1 quarter returned"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = MultiGumballMachine(numBalls: 1, outStream: outStream)
    
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.turnCrank()
    
    gumballMachine.ejectQuarter()
    
    XCTAssertEqual(expectedMessage, outStream.lastLog)
    
    let naiveOutStream = TextStream.OStream(type: .logs)
    let naiveMachine = NaiveMultiGumballMachine(numBalls: 5, outStream: naiveOutStream)
    
    naiveMachine.insertQuarter()
    naiveMachine.insertQuarter()
    naiveMachine.turnCrank()
    
    naiveMachine.ejectQuarter()
    
    XCTAssertEqual(expectedMessage, naiveOutStream.lastLog)
  }
  
  func testCorrectSoldOutStateEjectQuarterIfQuartersInMachine() {
    let expectedMessage = "4 quarters returned"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = MultiGumballMachine(numBalls: 1, outStream: outStream)
    
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()

    gumballMachine.turnCrank()
    
    gumballMachine.ejectQuarter()
    
    XCTAssertEqual(expectedMessage, outStream.lastLog)
  }
  
  func testCorrectSoldOutStateInsertGumball() {
    let expectedMessage = "Gumball inserted. Gumball count: 5"
    
    let outStream = TextStream.OStream(type: .logs)
    let gumballMachine = MultiGumballMachine(numBalls: 1, outStream: outStream)
    
    gumballMachine.insertQuarter()
    gumballMachine.turnCrank()
    
    gumballMachine.insertGumball()
    gumballMachine.insertGumball()
    gumballMachine.insertGumball()
    gumballMachine.insertGumball()
    gumballMachine.insertGumball()
    
    XCTAssertEqual(expectedMessage, outStream.lastLog)
  }

}
