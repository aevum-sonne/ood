//
//  main.swift
//  GumballMachine
//
//  Created by User on 01.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import TextStream

func playWithGumballMachine(gumballMachine: GumballMachineProtocol) {
  gumballMachine.insertQuarter()
  gumballMachine.turnCrank()

  print(gumballMachine.toString())

  gumballMachine.insertQuarter()
  gumballMachine.ejectQuarter()
  gumballMachine.turnCrank()

  print(gumballMachine.toString())

  gumballMachine.insertQuarter()
  gumballMachine.turnCrank()
  gumballMachine.insertQuarter()
  gumballMachine.turnCrank()
  gumballMachine.ejectQuarter()

  print(gumballMachine.toString())

  gumballMachine.insertQuarter()
  gumballMachine.insertQuarter()
  gumballMachine.turnCrank()
  gumballMachine.insertQuarter()
  gumballMachine.turnCrank()
  gumballMachine.insertQuarter()
  gumballMachine.turnCrank()

  print(gumballMachine.toString())
}

let outStream = TextStream.OStream(type: .console)
let gumballMachine = GumballMachine(numBalls: 5, outStream: outStream)

playWithGumballMachine(gumballMachine: gumballMachine)
