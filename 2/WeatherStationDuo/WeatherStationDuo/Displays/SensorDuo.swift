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
    return sensor === internalSensor ? "Internal" : "External"
  }
  
  init(internalSensor: WeatherData, externalSensor: WeatherData) {
    self.internalSensor = internalSensor
    self.externalSensor = externalSensor
  }
  
  private var internalSensor: IObservable<WeatherInfo>
  private var externalSensor: IObservable<WeatherInfo>
}
