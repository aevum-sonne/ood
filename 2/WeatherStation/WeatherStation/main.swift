//
//  main.swift
//  WeatherStation
//
//  Created by User on 16.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

var wd = WeatherData()

var display: IObserver<WeatherInfo> = Display()
wd.registerObserver(priority: 1, observer: &display)

var statsDisplay: IObserver<WeatherInfo> = StatsDisplay()
wd.registerObserver(priority: 2, observer: &statsDisplay)

wd.setMeasurements(temperature: 3, humidity: 0.7, pressure: 760)
wd.setMeasurements(temperature: 4, humidity: 0.8, pressure: 761)

wd.removeObserver(observer: &statsDisplay)

wd.setMeasurements(temperature: 10, humidity: 0.8, pressure: 761)
wd.setMeasurements(temperature: -10, humidity: 0.8, pressure: 761)
