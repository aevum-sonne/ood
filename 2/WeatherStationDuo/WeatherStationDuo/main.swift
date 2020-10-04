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

internalWeatherSensor.setMeasurements(temperature: 54, humidity: 0.2, pressure: 563)
externalWeatherSensor.setMeasurements(temperature: 34, humidity: 0.5, pressure: 666)

var statsDisplayDuo: IObserver<WeatherInfo> = StatsDisplayDuo(internalSensor: internalWeatherSensor, externalSensor: externalWeatherSensor)

internalWeatherSensor.registerObserver(priority: 2, observer: &statsDisplayDuo)
externalWeatherSensor.registerObserver(priority: 2, observer: &statsDisplayDuo)

internalWeatherSensor.setMeasurements(temperature: 73, humidity: 0.8, pressure: 669)
externalWeatherSensor.setMeasurements(temperature: 110, humidity: 0.11, pressure: 644)
