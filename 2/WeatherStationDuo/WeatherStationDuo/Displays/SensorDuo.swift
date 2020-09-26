//
//  SensorDuo.swift
//  WeatherStationDuo
//
//  Created by User on 26.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class SensorDuo
{
  func getType(sensor: IObservable<WeatherInfo>) -> String {
    if (sensor === externalSensor) {
      return "External"
    }
    else if (sensor === internalSensor) {
      return "Internal"
    }
    else {
      return "Undefined"
    }
  }
  
  init(internalSensor: WeatherData, externalSensor: WeatherData) {
    self.internalSensor = internalSensor
    self.externalSensor = externalSensor
  }
  
  init() {
    self.internalSensor = WeatherData()
    self.externalSensor = WeatherData()
  }
  
  private var internalSensor: IObservable<WeatherInfo>
  private var externalSensor: IObservable<WeatherInfo>
}
