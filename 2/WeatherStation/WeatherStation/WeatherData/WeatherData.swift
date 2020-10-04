//
//  WeatherData.swift
//  WeatherStation
//
//  Created by User on 16.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class WeatherData : Observable<WeatherInfo>
{
  func measurementsChanged() {
    notifyObservers()
  }
  
  func setMeasurements(temperature: Double, humidity: Double, pressure: Double) {
    self.humidity = humidity
    self.temperature = temperature
    self.pressure = pressure
    
    measurementsChanged()
  }
  
  override func getChangedData() -> WeatherInfo {
    return WeatherInfo(temperature: temperature, humidity: humidity, pressure: pressure)
  }
  
  private(set) var temperature: Double = 0
  private(set) var humidity: Double = 0
  private(set) var pressure: Double = 760
}
