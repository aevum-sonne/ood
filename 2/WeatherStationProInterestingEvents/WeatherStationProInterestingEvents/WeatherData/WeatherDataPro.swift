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
  func measurementsChanged(eventsToUpdate: [WeatherEvent]) {
    notifyObservers(eventsToUpdate: eventsToUpdate)
  }
  
  func setMeasurements(temperature: Double, humidity: Double, pressure: Double, windSpeed: Double, windDirection: Double) {
    let eventsToUpdate = getEventsToUpdate(temperature: temperature, humidity: humidity, pressure: pressure, windSpeed: windSpeed, windDirection: windDirection)
    
    self.temperature = temperature
    self.humidity = humidity
    self.pressure = pressure
    self.wind = Wind(speed: windSpeed, direction: windDirection)
    
    measurementsChanged(eventsToUpdate: eventsToUpdate)
  }
  
  private func getEventsToUpdate(temperature: Double, humidity: Double, pressure: Double, windSpeed: Double, windDirection: Double) -> [WeatherEvent] {
    var eventsToUpdate = [WeatherEvent]()
    
    if (self.temperature != temperature) {
      eventsToUpdate.append(.temperature)
    }
    
    if (self.humidity != humidity) {
      eventsToUpdate.append(.humidity)
    }
    
    if (self.pressure != pressure) {
      eventsToUpdate.append(.pressure)
    }
    
    if (self.wind.speed != windSpeed) {
      eventsToUpdate.append(.speed)
    }
    
    if (self.wind.direction != windDirection) {
      eventsToUpdate.append(.direction)
    }
    
    return eventsToUpdate
  }
  
  override func getChangedData() -> WeatherInfoPro {
    return WeatherInfoPro(temperature: temperature, humidity: humidity, pressure: pressure, wind: wind)
  }
  
  private(set) var temperature: Double = 0
  private(set) var humidity: Double = 0
  private(set) var pressure: Double = 760
  private(set) var wind: Wind = Wind()
}
