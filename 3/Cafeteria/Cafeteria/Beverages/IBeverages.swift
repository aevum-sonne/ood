//
//  IBeverages.swift
//  Cafeteria
//
//  Created by User on 06.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class IBeverage {
  init() {
    self.beverage = nil
  }
  
  func getDescription() -> String { return "" }
  func getCost() -> Double { return 0 }
  
  var beverage: IBeverage?
}
