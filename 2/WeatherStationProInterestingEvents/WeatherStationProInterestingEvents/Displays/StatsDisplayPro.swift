//
//  StatsDisplayPro.swift
//  WeatherStationPro
//
//  Created by User on 26.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class StatsDisplayPro : IObserver<WeatherInfoPro, WeatherEvent>
{
  override func update(data: inout WeatherInfoPro, event: WeatherEvent) {
    switch (event) {
      case .temperature:
        temperatureStats.updateStats(data: data.temperature)
      case .humidity:
        humidityStats.updateStats(data: data.humidity)
      case .pressure:
        pressureStats.updateStats(data: data.pressure)
      case .speed, .direction:
        windStats.updateStats(data: data.wind)
    }
  }

  private var temperatureStats = Stats(type: "Temp")
  private var humidityStats = Stats(type: "Hum")
  private var pressureStats = Stats(type: "Pressure")
  private var windStats = WindStats()
}
