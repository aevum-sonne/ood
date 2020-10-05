//
//  WeatherDataPro.swift
//  WeatherStationPro
//
//  Created by User on 26.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class WeatherData : Observable<WeatherInfoPro, WeatherEvent>
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
  
  override func getChangedData() -> WeatherInfoPro {
    return WeatherInfoPro(temperature: temperature, humidity: humidity, pressure: pressure, wind: wind)
  }
  
  private(set) var temperature: Double = 0
  private(set) var humidity: Double = 0
  private(set) var pressure: Double = 760
  private(set) var wind: Wind = Wind()
}
