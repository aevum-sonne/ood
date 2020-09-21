//
//  StatsDisplay.swift
//  WeatherStation
//
//  Created by User on 20.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class StatsDisplay : IObserver<WeatherInfo>
{
  override func update(data: inout WeatherInfo) {
    temperatureStats.updateStats(data: data.temperature)
    humidityStats.updateStats(data: data.humidity)
    pressureStats.updateStats(data: data.pressure)
  }

  private var temperatureStats = Stats(type: "Temp")
  private var humidityStats = Stats(type: "Hum")
  private var pressureStats = Stats(type: "Pressure")
}
