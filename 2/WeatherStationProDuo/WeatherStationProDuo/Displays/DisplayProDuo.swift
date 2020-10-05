//
//  DisplayProDuo.swift
//  WeatherStationProDuo
//
//  Created by User on 29.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class DisplayProDuo : IObserver<WeatherInfoProDuo>
{
  init(internalSensor: WeatherData, externalSensor: WeatherDataPro) {
    self.sensors = SensorDuo(internalSensor: internalSensor, externalSensor: externalSensor)
  }
  
  override func update(data: inout WeatherInfoProDuo, observable: IObservable<WeatherInfoProDuo>) {
    print(sensors.getSensorType(sensor: observable) + " sensor:")
    
    print("Current Temp \(data.temperature)")
    print("Current Hum \(data.humidity)")
    print("Current Pressure \(data.pressure)")
    
    if (data.wind != nil) {
      print("Current Wind Direction \(data.wind!.direction)")
      print("Current Wind Speed \(data.wind!.speed)")
    }
    
    print("----------------")
  }
  
  private var sensors: SensorDuo
}
