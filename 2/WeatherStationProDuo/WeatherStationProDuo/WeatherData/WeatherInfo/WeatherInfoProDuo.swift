//
//  WeatherInfoProDuo.swift
//  WeatherStationProDuo
//
//  Created by User on 29.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

struct WeatherInfoProDuo
{
  // External sensor
  init(temperature: Double, humidity: Double, pressure: Double, wind: Wind!) {
    self.temperature = temperature
    self.humidity = humidity
    self.pressure = pressure
    self.wind = wind
  }
  
  // Internal sensor
  init(temperature: Double, humidity: Double, pressure: Double) {
    self.temperature = temperature
    self.humidity = humidity
    self.pressure = pressure
  }
  
  var temperature: Double
  var humidity: Double
  var pressure: Double
  
  var wind: Wind?
}
