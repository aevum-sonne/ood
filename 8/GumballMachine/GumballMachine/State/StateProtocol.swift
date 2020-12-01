//
//  StateProtocol.swift
//  GumballMachine
//
//  Created by User on 01.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

protocol StateProtocol {
  func insertQuarter()
  func ejectQuarter()
  func turnCrank()
  func dispense()
  
  func toString() -> String
}
