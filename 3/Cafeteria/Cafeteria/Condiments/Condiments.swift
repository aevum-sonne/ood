//
//  Condiments.swift
//  Cafeteria
//
//  Created by User on 06.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class CondimentDecorator : BeverageProtocol {
  let description: String
  let cost: Double
  
  let condimentDescription: String
  let condimentCost: Double
  
  init(beverage: BeverageProtocol, condimentDescription: String, condimentCost: Double) {
    self.beverage = beverage
    
    self.description = beverage.description + ", " + condimentDescription
    self.cost = beverage.cost + condimentCost
    
    self.condimentDescription = condimentDescription
    self.condimentCost = condimentCost
  }
  
  private let beverage: BeverageProtocol
}

protocol CondimentProtocol {
  var condimentDescription: String { get }
  var condimentCost: Double { get }
}

class Cinnamon : CondimentDecorator {
  init(beverage: BeverageProtocol) {
    let condimentDescription = "Cinnamon"
    let condimentCost: Double = 20
    
    super.init(beverage: beverage, condimentDescription: condimentDescription, condimentCost: condimentCost)
  }
}

class Lemon : CondimentDecorator {
  init(beverage: BeverageProtocol, quantity: UInt) {
    let condimentDescription = "Lemon x\(quantity)"
    let condimentCost = Double(10 * quantity)
    
    super.init(beverage: beverage, condimentDescription: condimentDescription, condimentCost: condimentCost)
  }
}

enum IceCubeType : String {
  case dry = "Dry"
  case water = "Water"
}

class IceCubes : CondimentDecorator {
  init(beverage: BeverageProtocol, quantity: UInt, type: IceCubeType = IceCubeType.water) {
    let condimentDescription = type.rawValue
    let condimentCost = (type == IceCubeType.dry ? 10 : 5) * Double(quantity)
      
    super.init(beverage: beverage, condimentDescription: condimentDescription, condimentCost: condimentCost)
  }
}

enum SyrupType: String {
  case chocolate = "Chocolate"
  case maple = "Maple"
}

class Syrup : CondimentDecorator {
  init(beverage: BeverageProtocol, type: SyrupType) {
    let condimentDescription = type.rawValue + " syrup"
    let condimentCost: Double = 15
      
    super.init(beverage: beverage, condimentDescription: condimentDescription, condimentCost: condimentCost)
  }
}

class ChocolateCrumbs : CondimentDecorator {
  init(beverage: BeverageProtocol, mass: UInt) {
    let condimentDescription = "Chocolate crumbs \(mass)g"
    let condimentCost = 2 * Double(mass)
      
    super.init(beverage: beverage, condimentDescription: condimentDescription, condimentCost: condimentCost)
  }
}

class CocountFlakes : CondimentDecorator {
  init(beverage: BeverageProtocol, mass: UInt) {
    let condimentDescription = "Cocount flakes \(mass)g"
    let condimentCost = Double(mass)
      
    super.init(beverage: beverage, condimentDescription: condimentDescription, condimentCost: condimentCost)
  }
}

class Cream : CondimentDecorator {
  init(beverage: BeverageProtocol) {
    let condimentDescription = "Cream"
    let condimentCost: Double = 25
      
    super.init(beverage: beverage, condimentDescription: condimentDescription, condimentCost: condimentCost)
  }
}

class Chocolate : CondimentDecorator {
  init(beverage: BeverageProtocol, quantity: UInt) {
    let quantity = quantity <= 5 ? quantity : 5
    let condimentDescription = "Chocolate x\(quantity)"
    let condimentCost = 10 * Double(quantity)
    
    super.init(beverage: beverage, condimentDescription: condimentDescription, condimentCost: condimentCost)
  }
}

enum LiquorType: String {
  case nut = "Nut"
  case chocolate = "Chocolate"
}

class Liquor : CondimentDecorator {
  init(beverage: BeverageProtocol, type: LiquorType) {
    let condimentDescription = "\(type.rawValue) Liquor"
    let condimentCost: Double = 50
    
    super.init(beverage: beverage, condimentDescription: condimentDescription, condimentCost: condimentCost)
  }
}
