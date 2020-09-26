//
//  DisplayDuo.swift
//  WeatherStationDuo
//
//  Created by User on 25.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class DisplayDuo : IObserver<WeatherInfo>
{
  override func update(data: inout WeatherInfo, observable: IObservable<WeatherInfo>) {
    print(sensors.getType(sensor: observable) + " sensor:")
    
    print("Current Temp \(data.temperature)")
    print("Current Hum \(data.humidity)")
    print("Current Pressure \(data.pressure)")
    print("----------------")
  }
    
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
