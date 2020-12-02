//
//  main.swift
//  MultiGumballMachine
//
//  Created by User on 02.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import TextStream

func playWithMultiGumballMachine(gumballMachine: MultiGumballMachineProtocol) {
  gumballMachine.insertQuarter()
  gumballMachine.insertQuarter()
  gumballMachine.turnCrank()
  gumballMachine.insertQuarter()
  gumballMachine.insertQuarter()
  gumballMachine.turnCrank()
  gumballMachine.insertQuarter()
  
  gumballMachine.turnCrank()
  gumballMachine.turnCrank()
  
  gumballMachine.ejectQuarter()
    
  print(gumballMachine.toString())
}

let outStream = TextStream.OStream(type: .console)
let gumballMachine = MultiGumballMachine(numBalls: 4, outStream: outStream)

playWithMultiGumballMachine(gumballMachine: gumballMachine)
