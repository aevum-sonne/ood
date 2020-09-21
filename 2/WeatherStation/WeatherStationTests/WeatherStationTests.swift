//
//  WeatherStationTests.swift
//  WeatherStationTests
//
//  Created by User on 20.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

@testable import WeatherStation

import XCTest

class RemoveObserverDisplay : IObserver<WeatherInfo>
{
  override func update(data: inout WeatherInfo) {
    observable.observers.removeAll()
  }
  
  required init(observable: inout WeatherData) {
    self.observable = observable
  }
  
  required init() {
    self.observable = Observable<WeatherInfo>()
  }
  
  private var observable: Observable<WeatherInfo>
}

class WeatherStationTests: XCTestCase
{
  func testRemoveObserverInsideDisplayUpdate() throws {
    var wd = WeatherData()
    var display: IObserver<WeatherInfo> = RemoveObserverDisplay(observable: &wd)
    
    wd.registerObserver(observer: &display)
    
    XCTAssertNoThrow(wd.setMeasurements(temperature: 2, humidity: 1, pressure: 3))
  }
}
