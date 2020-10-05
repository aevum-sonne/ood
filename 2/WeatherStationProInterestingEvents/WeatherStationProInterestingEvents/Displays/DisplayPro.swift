//
//  DisplayPro.swift
//  WeatherStationPro
//
//  Created by User on 26.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class DisplayPro : IObserver<WeatherInfoPro, WeatherEvent>
{
  override func update(data: inout WeatherInfoPro, event: WeatherEvent) {
    switch (event) {
      case .temperature:
        print("Current Temp \(data.temperature)")
      case .humidity:
        print("Current Hum \(data.humidity)")
      case .pressure:
        print("Current Pressure \(data.pressure)")
      case .speed:
        print("Current Wind Speed \(data.wind.speed)")
      case .direction:
        print("Current Wind Direction \(data.wind.direction)")
    }
    
    print("----------------")
  }
}
