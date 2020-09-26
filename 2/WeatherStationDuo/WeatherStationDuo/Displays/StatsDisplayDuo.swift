//
//  StatsDisplayDuo.swift
//  WeatherStation
//
//  Created by User on 20.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class StatsDisplayDuo : IObserver<WeatherInfo>
{
  override func update(data: inout WeatherInfo, observable: IObservable<WeatherInfo>) {
    print(sensors.getType(sensor: observable) + " Stats sensor:")

    temperatureStats.updateStats(data: data.temperature)
    humidityStats.updateStats(data: data.humidity)
    pressureStats.updateStats(data: data.pressure)
  }
  
  private var temperatureStats = Stats(type: "Temp")
  private var humidityStats = Stats(type: "Hum")
  private var pressureStats = Stats(type: "Pressure")
    
  init(internalSensor: WeatherData, externalSensor: WeatherData) {
    self.sensors = SensorDuo(internalSensor: internalSensor, externalSensor: externalSensor)
    
    super.init()
  }
  
  required init() {
    self.sensors = SensorDuo()
    
    super.init()
  }
  
  private var sensors: SensorDuo
}
