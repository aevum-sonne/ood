//
//  Display.swift
//  WeatherStation
//
//  Created by User on 20.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class Display : IObserver<WeatherInfo>
{
  override func update(data: inout WeatherInfo) {
    print("Current Temp \(data.temperature)")
    print("Current Hum \(data.humidity)")
    print("Current Pressure \(data.pressure)")
    print("----------------")
  }
}
