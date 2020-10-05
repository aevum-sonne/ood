//
//  StatsDisplayProDuo.swift
//  WeatherStationProDuo
//
//  Created by User on 29.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class StatsDisplayProDuo : IObserver<WeatherInfoProDuo>
{
  init(internalSensor: WeatherData, externalSensor: WeatherDataPro) {
    self.sensors = SensorDuo(internalSensor: internalSensor, externalSensor: externalSensor)
  }
  
  override func update(data: inout WeatherInfoProDuo, observable: IObservable<WeatherInfoProDuo>) {
    print(sensors.getSensorType(sensor: observable) + " Stats sensor:")
    
    temperatureStats.updateStats(data: data.temperature)
    humidityStats.updateStats(data: data.humidity)
    pressureStats.updateStats(data: data.pressure)
    
    if (data.wind != nil) {
      windStats.updateStats(data: data.wind!)
    }
  }

  private var temperatureStats = Stats(type: "Temp")
  private var humidityStats = Stats(type: "Hum")
  private var pressureStats = Stats(type: "Pressure")
  private var windStats = WindStats()
  
  private var sensors: SensorDuo
}
