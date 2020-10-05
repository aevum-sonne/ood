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
  init(internalSensor: WeatherData, externalSensor: WeatherDataPro) {
    self.internalSensor = internalSensor
    self.externalSensor = externalSensor
  }
  
  func getSensorType(sensor: IObservable<WeatherInfoProDuo>) -> String {
    return sensor === internalSensor ? "Internal" : "External"
  }

  private var internalSensor: WeatherData = WeatherData()
  private var externalSensor: WeatherDataPro = WeatherDataPro()
}
