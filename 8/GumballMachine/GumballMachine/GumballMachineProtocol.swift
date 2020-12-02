//
//  GumballMachineProtocol.swift
//  GumballMachine
//
//  Created by User on 02.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

protocol GumballMachineProtocol {
  func ejectQuarter()
  func insertQuarter()
  func turnCrank()
  
  func toString() -> String
}
