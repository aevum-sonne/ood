//
//  WeatherStationTests.swift
//  WeatherStationTests
//
//  Created by User on 20.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

@testable import WeatherStationDuo

import XCTest

class SensorType
{
  var value: String = ""
}

class DisplayDuoTests : DisplayDuo
{
  init(internalSensor: WeatherData, externalSensor: WeatherData, sensorType: SensorType) {
    self.sensors = SensorDuo(internalSensor: internalSensor, externalSensor: externalSensor)
    self.sensorType = sensorType
    
    super.init(internalSensor: WeatherData(), externalSensor: WeatherData())
  }
  
  override func update(data: inout WeatherInfo, observable: IObservable<WeatherInfo>) {
    self.sensorType.value = sensors.getType(sensor: observable)
  }
  
  private var sensorType: SensorType
  private var sensors: SensorDuo
}

class WeatherStationDuoTests: XCTestCase
{
  func testExternalAndInternalSensorsDisplayDuo() throws {
    let internalSensor = WeatherData()
    let externalSensor = WeatherData()
    
    let sensorType = SensorType()
    
    var displayDuo: IObserver<WeatherInfo> = DisplayDuoTests(internalSensor: internalSensor, externalSensor: externalSensor, sensorType: sensorType)
    
    internalSensor.registerObserver(priority: 1, observer: &displayDuo)
    externalSensor.registerObserver(priority: 1, observer: &displayDuo)
    
    var expectedType = "Internal"
    internalSensor.setMeasurements(temperature: 1, humidity: 2, pressure: 3)
    XCTAssertEqual(expectedType, sensorType.value)

    expectedType = "External"
    externalSensor.setMeasurements(temperature: 1, humidity: 2, pressure: 3)
    XCTAssertEqual(expectedType, sensorType.value)
  }
}
