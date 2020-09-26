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
  func getTemperature() -> Double {
    return temperature
  }
  
  func getHumidity() -> Double {
    return humidity
  }
  
  func getPressure() -> Double {
    return pressure
  }
  
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
  
  private var temperature: Double = 0
  private var humidity: Double = 0
  private var pressure: Double = 760
}
