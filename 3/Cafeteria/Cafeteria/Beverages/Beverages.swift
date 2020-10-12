//
//  Beverages.swift
//  Cafeteria
//
//  Created by User on 06.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class Beverage : BeverageProtocol {
  var description: String
  var cost: Double = 0
  
  init(description: String) {
    self.description = description
  }
}

enum CoffeePortion: String {
  case standard = "Standard"
  case double = "Double"
}

class Coffee : Beverage {
  init(description: String = "Coffee", portion: CoffeePortion = .standard) {
    self.portion = portion
    
    super.init(description: description)
    self.cost = 60
  }
  
  private let portion: CoffeePortion
}

class Cappuccino : Coffee {
  init(portion: CoffeePortion) {
    super.init(description: "\(portion.rawValue) Cappuccino", portion: portion)
    self.cost = portion == .standard ? 80 : 120
  }
}

class Latte : Coffee {
  init(portion: CoffeePortion) {
    super.init(description: "\(portion.rawValue) Latte", portion: portion)
    self.cost = portion == .standard ? 90 : 130
  }
}

enum TeaType: String {
  case green = "Green"
  case black = "Black"
  case red = "Red"
  case herbal = "Herbal"
}

class Tea : Beverage {
  init(type: TeaType) {
    self.type = type
    
    super.init(description: "\(type.rawValue) Tea")
    self.cost = 30
  }
  
  private let type: TeaType
}

enum MilkShakePortion: String {
  case small = "Small"
  case medium = "Medium"
  case large = "Large"
}

class MilkShake : Beverage {
  init(portion: MilkShakePortion) {
    self.portion = portion
    
    super.init(description: "\(portion.rawValue) MilkShake")
    self.cost = portion == .small ? 50
      : portion == .medium ? 60
      : 80
  }
  
  private let portion: MilkShakePortion
}
