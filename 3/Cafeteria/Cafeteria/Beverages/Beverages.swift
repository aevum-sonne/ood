//
//  Beverages.swift
//  Cafeteria
//
//  Created by User on 06.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class Beverage : IBeverage {
  init(description: String) {
    self.description = description
    
    super.init()
  }
  
  override func getDescription() -> String {
    return description
  }
    
  private var description: String
}

enum CoffeePortion: String {
  case standard = "Standard"
  case double = "Double"
}

class Coffee : Beverage {
  init(description: String = "Coffee", portion: CoffeePortion = .standard) {
    self.portion = portion
    
    super.init(description: description)
  }
  
  override func getCost() -> Double {
    return 60
  }
  
  let portion: CoffeePortion
}

class Cappuccino : Coffee {
  init(portion: CoffeePortion) {
    super.init(description: "\(portion.rawValue) Cappuccino", portion: portion)
  }
  
  override func getCost() -> Double {
    return portion == .standard ? 80 : 120
  }
}

class Latte : Coffee {
  init(portion: CoffeePortion) {
    super.init(description: "\(portion.rawValue) Latte", portion: portion)
  }
  
  override func getCost() -> Double {
    return portion == .standard ? 90 : 130
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
  }
  
  override func getCost() -> Double {
    return 30
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
  }
  
  override func getCost() -> Double {
    return portion == .small ? 50
      : portion == .medium ? 60
      : 80
  }
  
  private let portion: MilkShakePortion
}
