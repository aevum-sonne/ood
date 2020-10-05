//
//  SensorDuo.swift
//  WeatherStationProDuo
//
//  Created by User on 29.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class SensorDuo
{
  func getSensorType(sensor: IObservable<WeatherInfoProDuo>) -> String {
    return sensor === internalSensor ? "Internal" : "External"
  }

  init(internalSensor: WeatherData, externalSensor: WeatherDataPro) {
    self.internalSensor = internalSensor
    self.externalSensor = externalSensor
  }
  
  private var internalSensor: WeatherData = WeatherData()
  private var externalSensor: WeatherDataPro = WeatherDataPro()
}
