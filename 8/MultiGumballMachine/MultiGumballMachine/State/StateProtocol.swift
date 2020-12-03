//
//  StateProtocol.swift
//  MultiGumballMachine
//
//  Created by User on 02.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

protocol StateProtocol {
  func insertQuarter()
  func ejectQuarter()
  
  func insertGumball()
  
  func turnCrank()
  func dispense()
  
  func toString() -> String
}
