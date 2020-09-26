//
//  main.swift
//  WeatherStation
//
//  Created by User on 16.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

var internalWeatherSensor = WeatherData()
var externalWeatherSensor = WeatherData()

var displayDuo: IObserver<WeatherInfo> = DisplayDuo(internalSensor: internalWeatherSensor, externalSensor: externalWeatherSensor)

internalWeatherSensor.registerObserver(priority: 1, observer: &displayDuo)
externalWeatherSensor.registerObserver(priority: 1, observer: &displayDuo)

internalWeatherSensor.setMeasurements(temperature: 1, humidity: 2, pressure: 3)
externalWeatherSensor.setMeasurements(temperature: 4, humidity: 5, pressure: 6)

var statsDisplayDuo: IObserver<WeatherInfo> = StatsDisplayDuo(internalSensor: internalWeatherSensor, externalSensor: externalWeatherSensor)

internalWeatherSensor.registerObserver(priority: 2, observer: &statsDisplayDuo)
externalWeatherSensor.registerObserver(priority: 2, observer: &statsDisplayDuo)

internalWeatherSensor.setMeasurements(temperature: 7, humidity: 8, pressure: 9)
externalWeatherSensor.setMeasurements(temperature: 10, humidity: 11, pressure: 12)
