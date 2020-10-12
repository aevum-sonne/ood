//
//  Condiments.swift
//  Cafeteria
//
//  Created by User on 06.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class CondimentDecorator : BeverageProtocol {
  var description: String = ""
  var cost: Double = 0
  
  init(beverage: BeverageProtocol) {
    self.beverage = beverage
    self.description = beverage.description + ", " + getCondimentDescription()
    self.cost = beverage.cost + getCondimentCost()
  }
  
  func getCondimentDescription() -> String { return "" }
  func getCondimentCost() -> Double { return 0 }
  
  private var beverage: BeverageProtocol
}

class Cinnamon : CondimentDecorator {
  override init(beverage: BeverageProtocol) {
    super.init(beverage: beverage)
  }
  
  override func getCondimentCost() -> Double {
    return 20
  }

  override func getCondimentDescription() -> String {
    return "Cinnamon"
  }
}

class Lemon : CondimentDecorator {
  init(beverage: BeverageProtocol, quantity: UInt) {
    self.quantity = quantity
    
    super.init(beverage: beverage)
  }
  
  override func getCondimentCost() -> Double {
    return Double(10 * quantity)
  }
  
  override func getCondimentDescription() -> String {
    return "Lemon x\(quantity)"
  }
  
  private var quantity: UInt
}

enum IceCubeType : String {
  case dry = "Dry"
  case water = "Water"
}

class IceCubes : CondimentDecorator {
  init(beverage: BeverageProtocol, quantity: UInt, type: IceCubeType = IceCubeType.water) {
    self.quantity = quantity
    self.type = type
    
    super.init(beverage: beverage)
  }
  
  override func getCondimentCost() -> Double {
    return (type == IceCubeType.dry ? 10 : 5) * Double(quantity)
  }
  
  override func getCondimentDescription() -> String {
    return type.rawValue
  }
  
  private var quantity: UInt
  private var type: IceCubeType
}

enum SyrupType: String {
  case chocolate = "Chocolate"
  case maple = "Maple"
}

class Syrup : CondimentDecorator {
  init(beverage: BeverageProtocol, type: SyrupType) {
    self.type = type
    
    super.init(beverage: beverage)
  }
  
  override func getCondimentCost() -> Double {
    return 15
  }
  
  override func getCondimentDescription() -> String {
    return type.rawValue + " syrup"
  }
  
  private var type: SyrupType
}

class ChocolateCrumbs : CondimentDecorator {
  init(beverage: BeverageProtocol, mass: UInt) {
    self.mass = mass
    
    super.init(beverage: beverage)
  }
  
  override func getCondimentCost() -> Double {
    return 2 * Double(mass)
  }
  
  override func getCondimentDescription() -> String {
    return "Chocolate crumbs \(mass)g"
  }
  
  private var mass: UInt
}

class CocountFlakes : CondimentDecorator {
  init(beverage: BeverageProtocol, mass: UInt) {
    self.mass = mass
    
    super.init(beverage: beverage)
  }
  
  override func getCondimentCost() -> Double {
    return Double(mass)
  }
  
  override func getCondimentDescription() -> String {
    return "Cocount flakes \(mass)g"
  }
  
  private var mass: UInt
}

class Cream : CondimentDecorator {
  override init(beverage: BeverageProtocol) {
    super.init(beverage: beverage)
  }
  
  override func getCondimentCost() -> Double {
    return 25
  }
  
  override func getCondimentDescription() -> String {
    return "Cream"
  }
}

class Chocolate : CondimentDecorator {
  init(beverage: BeverageProtocol, quantity: UInt) {
    self.quantity = quantity <= 5 ? quantity : 5
    
    super.init(beverage: beverage)
  }
  
  override func getCondimentCost() -> Double {
    return 10 * Double(quantity)
  }
  
  override func getCondimentDescription() -> String {
    return "Chocolate x\(quantity)"
  }
  
  private let quantity: UInt
}

enum LiquorType: String {
  case nut = "Nut"
  case chocolate = "Chocolate"
}

class Liquor : CondimentDecorator {
  init(beverage: BeverageProtocol, type: LiquorType) {
    self.type = type
    
    super.init(beverage: beverage)
  }
  
  override func getCondimentCost() -> Double {
    return 50
  }
  
  override func getCondimentDescription() -> String {
    return "\(type.rawValue) Liquor"
  }
  
  private let type: LiquorType
}
