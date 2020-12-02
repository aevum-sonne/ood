//
//  MultiGumballMachineContextProtocol.swift
//  MultiGumballMachine
//
//  Created by User on 02.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

protocol MultiGumballMachineContextProtocol {
  var ballCount: UInt { get }
  
  func releaseBall()
  
  func setSoldOutState()
  func setNoQuarterState()
  func setSoldState()
  func setHasQuarterState()
}
