//
//  WeatherStationTests.swift
//  WeatherStationTests
//
//  Created by User on 20.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

@testable import WeatherStationDuo

import XCTest

class DisplayDuoTests : DisplayDuo
{
  override func update(data: inout WeatherInfo, observable: IObservable<WeatherInfo>) {
    sensorType.pointee = sensors.getType(sensor: observable)
  }
  
  init(internalSensor: WeatherData, externalSensor: WeatherData, sensorType: UnsafeMutablePointer<String>) {
    self.sensors = SensorDuo(internalSensor: internalSensor, externalSensor: externalSensor)
    self.sensorType = sensorType
    
    super.init(internalSensor: WeatherData(), externalSensor: WeatherData())
  }
  
  private var sensors: SensorDuo
  private var sensorType: UnsafeMutablePointer<String>
}

class WeatherStationDuoTests: XCTestCase
{
  func testExternalAndInternalSensorsDisplayDuo() throws {
    let inSensor = WeatherData()
    let outSensor = WeatherData()
    
    var sensorType = ""
    
    var displayDuo: IObserver<WeatherInfo> = DisplayDuoTests(internalSensor: inSensor, externalSensor: outSensor, sensorType: &sensorType)
    
    inSensor.registerObserver(priority: 1, observer: &displayDuo)
    outSensor.registerObserver(priority: 1, observer: &displayDuo)
    
    var expectedType = "Internal"
    inSensor.setMeasurements(temperature: 1, humidity: 2, pressure: 3)
    XCTAssertEqual(expectedType, sensorType)
    
    expectedType = "External"
    outSensor.setMeasurements(temperature: 1, humidity: 2, pressure: 3)
    XCTAssertEqual(expectedType, sensorType)
  }
}
