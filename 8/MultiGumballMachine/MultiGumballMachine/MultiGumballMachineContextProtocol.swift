//
//  MultiGumballMachineContextProtocol.swift
//  MultiGumballMachine
//
//  Created by User on 02.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

protocol MultiGumballMachineContextProtocol: MultiGumballMachineProtocol {
  var ballCount: UInt { get }
  
  var quarterCount: UInt { get }
  
  func addQuarter()
  func ejectAllQuarters()
  func releaseBall()
  
  func setSoldOutState()
  func setNoQuarterState()
  func setSoldState()
  func setHasQuarterState()
}
