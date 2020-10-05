//
//  main.swift
//  WeatherStationPro
//
//  Created by User on 26.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

var wd = WeatherData()

var statsDisplay: IObserver<WeatherInfoPro, WeatherEvent> = StatsDisplayPro()
var display1: IObserver<WeatherInfoPro, WeatherEvent> = DisplayPro()
var display3: IObserver<WeatherInfoPro, WeatherEvent> = DisplayPro()

wd.registerObserver(priority: 3, observer: &display3, events: [WeatherEvent.temperature, WeatherEvent.direction])
wd.registerObserver(priority: 2, observer: &statsDisplay, events: [WeatherEvent.direction])
wd.registerObserver(priority: 1, observer: &display1, events: [WeatherEvent.temperature, WeatherEvent.humidity])
wd.registerObserver(priority: 3, observer: &display3, events: [WeatherEvent.humidity])

// Subscribe/unsubscribe
wd.subscribeObserver(priority: 1, observer: &display1, event: WeatherEvent.speed)
wd.setMeasurements(temperature: 30, humidity: 22, pressure: 760, windSpeed: 15, windDirection: 180)
wd.unsubscribeObserver(observer: &display1, event: WeatherEvent.speed)

wd.setMeasurements(temperature: 60, humidity: 44, pressure: 780, windSpeed: 3, windDirection: 90)
wd.setMeasurements(temperature: 30, humidity: 20, pressure: 30, windSpeed: 15, windDirection: 90)
wd.setMeasurements(temperature: 30, humidity: 20, pressure: 30, windSpeed: 15, windDirection: 180)
