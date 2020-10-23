//
//  Beverages.swift
//  Cafeteria
//
//  Created by User on 06.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class Beverage : BeverageProtocol {
  let description: String
  let cost: Double
  
  init(description: String, cost: Double) {
    self.description = description
    self.cost = cost
  }
}

enum CoffeePortion: String {
  case standard = "Standard"
  case double = "Double"
}

class Coffee : Beverage {
  init(description: String = "Coffee", cost: Double, portion: CoffeePortion = .standard) {
    
    super.init(description: description, cost: 0)
  }
}

class Cappuccino : Coffee {
  init(portion: CoffeePortion) {
    let cost: Double = portion == .standard ? 80 : 120
    super.init(description: "\(portion.rawValue) Cappuccino", cost: cost, portion: portion)
  }
}

class Latte : Coffee {
  init(portion: CoffeePortion) {
    let cost: Double = portion == .standard ? 90 : 130
    super.init(description: "\(portion.rawValue) Latte", cost: cost, portion: portion)
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
    super.init(description: "\(type.rawValue) Tea", cost: 30)
  }
}

enum MilkShakePortion: String {
  case small = "Small"
  case medium = "Medium"
  case large = "Large"
}

class MilkShake : Beverage {
  init(portion: MilkShakePortion) {
    let cost: Double = portion == .small ? 50
      : portion == .medium ? 60
      : 80
    
    super.init(description: "\(portion.rawValue) MilkShake", cost: cost)
  }
}
