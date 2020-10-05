//
//  WeatherData.swift
//  WeatherStationProDuo
//
//  Created by User on 29.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class WeatherData : Observable<WeatherInfoProDuo>
{
  func measurementsChanged() {
    notifyObservers()
  }
  
  func setMeasurements(temperature: Double, humidity: Double, pressure: Double) {
    self.temperature = temperature
    self.humidity = humidity
    self.pressure = pressure
    
    measurementsChanged()
  }
  
  override func getChangedData() -> WeatherInfoProDuo {
    return WeatherInfoProDuo(temperature: temperature, humidity: humidity, pressure: pressure)
  }
  
  private(set) var temperature: Double = 0
  private(set) var humidity: Double = 0
  private(set) var pressure: Double = 760
}
