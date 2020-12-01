//
//  GumballMachineContextProtocol.swift
//  GumballMachine
//
//  Created by User on 01.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

protocol GumballMachineContextProtocol {
  var ballCount: UInt { get }
  
  func releaseBall()
  
  func setSoldOutState()
  func setNoQuarterState()
  func setSoldState()
  func setHasQuarterState()
}
