//
//  WeatherDataPro.swift
//  WeatherStationProDuo
//
//  Created by User on 29.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class WeatherDataPro : Observable<WeatherInfoProDuo>
{
  func measurementsChanged() {
    notifyObservers()
  }
  
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

  private(set) var temperature: Double = 0
  private(set) var humidity: Double = 0
  private(set) var pressure: Double = 760
  
  private(set) var wind: Wind = Wind()
}
