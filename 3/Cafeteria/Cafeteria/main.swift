//
//  main.swift
//  Cafeteria
//
//  Created by User on 06.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

let latte = Latte(portion: .standard)
let iceCubes = IceCubes(beverage: latte, quantity: 2)
let lemon = Lemon(beverage: iceCubes, quantity: 1)
let cinnamon = Cinnamon(beverage: lemon)
let chocolateCrumbs = ChocolateCrumbs(beverage: cinnamon, mass: 1)
let cocountFlakes = CocountFlakes(beverage: chocolateCrumbs, mass: 5)
let cream = Cream(beverage: cocountFlakes)
let chocolate = Chocolate(beverage: cream, quantity: 99999)
let liquor = Liquor(beverage: chocolate, type: .nut)

print(liquor.description)
print(liquor.cost)
