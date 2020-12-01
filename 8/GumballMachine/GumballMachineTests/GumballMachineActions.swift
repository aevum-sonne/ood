//
//  GumballMachineActions.swift
//  GumballMachineTests
//
//  Created by User on 01.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class GumballMachineActions {
  static func buyGum(gumballMachine: GumballMachine) {
    gumballMachine.insertQuarter()
    gumballMachine.turnCrank()
  }
}
