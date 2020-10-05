//
//  main.swift
//  WeatherStationProDuo
//
//  Created by User on 29.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

var internalSensor = WeatherData()
var externalSensor = WeatherDataPro()

var display: IObserver<WeatherInfoProDuo> = DisplayProDuo(internalSensor: internalSensor, externalSensor: externalSensor)
var statsDisplay: IObserver<WeatherInfoProDuo> = StatsDisplayProDuo(internalSensor: internalSensor, externalSensor: externalSensor)

externalSensor.registerObserver(priority: 1, observer: &display)
internalSensor.registerObserver(priority: 1, observer: &display)

externalSensor.registerObserver(priority: 1, observer: &statsDisplay)
internalSensor.registerObserver(priority: 1, observer: &statsDisplay)

externalSensor.setMeasurements(temperature: 40, humidity: 0.2, pressure: 760, windSpeed: 15, windDirection: 90)
externalSensor.setMeasurements(temperature: 30, humidity: 0.52, pressure: 730, windSpeed: 4, windDirection: 180)

//externalSensor.setMeasurements(temperature: 40, humidity: 0.22, pressure: 760, windSpeed: 10, windDirection: 90)
//internalSensor.setMeasurements(temperature: 40, humidity: 0.62, pressure: 660)

