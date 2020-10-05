//
//  WeatherDataPro.swift
//  WeatherStationProDuo
//
//  Created by User on 29.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class WeatherDataPro : WeatherData
{
  func setMeasurements(temperature: Double, humidity: Double, pressure: Double, windSpeed: Double, windDirection: Double) {
    self.temperature = temperature
    self.humidity = humidity
    self.pressure = pressure
    self.wind = Wind(speed: windSpeed, direction: windDirection)
    
    measurementsChanged()
  }
  
  override func getChangedData() -> WeatherInfoProDuo {
    return WeatherInfoProDuo(temperature: temperature, humidity: humidity, pressure: pressure, wind: Wind(speed: wind.speed, direction: wind.direction))
  }

  public internal(set) var wind: Wind = Wind()
}
