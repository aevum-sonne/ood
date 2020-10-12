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
    var observer: IObserver<WeatherInfo> = self
    
    observable.removeObserver(observer: &observer)
  }
  
  init(observable: inout WeatherData) {
    self.observable = observable
  }
  
  override init() {
    self.observable = Observable<WeatherInfo>()
  }
  
  private var observable: Observable<WeatherInfo>
}

class Priorities
{
  var value: String = ""
}

class PriorityDisplay : IObserver<WeatherInfo>
{
  override func update(data: inout WeatherInfo) {
    priorities.value += String(priority)
  }
  
  init(priority: UInt64, priorities: Priorities) {
    self.priority = priority
    self.priorities = priorities
  }
  
  override init() {
    super.init()
  }
  
  private var priority: UInt64 = 0
  private var priorities = Priorities()
}

class WeatherStationTests: XCTestCase
{
  func testCorrectRemoveObserverInsideDisplayUpdate() throws {
    var wd = WeatherData()
    var display: IObserver<WeatherInfo> = RemoveObserverDisplay(observable: &wd)
    
    wd.registerObserver(priority: 1, observer: &display)
    
    XCTAssertNoThrow(wd.setMeasurements(temperature: 2, humidity: 1, pressure: 3))
  }
  
  func testCorrectObserverPriorityWorkWithOrderedInputValues() throws {
    let wd = WeatherData()
    
    let expected = "1234"
    let priorities = Priorities()
    
    var obs1: IObserver<WeatherInfo> = PriorityDisplay(priority: 1, priorities: priorities)
    var obs2: IObserver<WeatherInfo> = PriorityDisplay(priority: 2, priorities: priorities)
    var obs3: IObserver<WeatherInfo> = PriorityDisplay(priority: 3, priorities: priorities)
    var obs4: IObserver<WeatherInfo> = PriorityDisplay(priority: 4, priorities: priorities)
        
    wd.registerObserver(priority: 1, observer: &obs1)
    wd.registerObserver(priority: 2, observer: &obs2)
    wd.registerObserver(priority: 3, observer: &obs3)
    wd.registerObserver(priority: 4, observer: &obs4)
    
    wd.setMeasurements(temperature: 1, humidity: 2, pressure: 3)
    
    XCTAssertEqual(expected, priorities.value)
  }
  
  func testCorrectObserverPriorityWorkWithReverseOrderedInputValues() throws {
    let wd = WeatherData()

    let expected = "1234"
    let priorities = Priorities()

    var obs1: IObserver<WeatherInfo> = PriorityDisplay(priority: 4, priorities: priorities)
    var obs2: IObserver<WeatherInfo> = PriorityDisplay(priority: 3, priorities: priorities)
    var obs3: IObserver<WeatherInfo> = PriorityDisplay(priority: 2, priorities: priorities)
    var obs4: IObserver<WeatherInfo> = PriorityDisplay(priority: 1, priorities: priorities)

    wd.registerObserver(priority: 4, observer: &obs1)
    wd.registerObserver(priority: 3, observer: &obs2)
    wd.registerObserver(priority: 2, observer: &obs3)
    wd.registerObserver(priority: 1, observer: &obs4)

    wd.setMeasurements(temperature: 1, humidity: 2, pressure: 3)

    XCTAssertEqual(expected, priorities.value)
  }

  func testCorrectObserverPriorityWorkWithUnorderedInputValues() throws {
    let wd = WeatherData()

    let expected = "12234"
    let priorities = Priorities()

    var obs1: IObserver<WeatherInfo> = PriorityDisplay(priority: 3, priorities: priorities)
    var obs2: IObserver<WeatherInfo> = PriorityDisplay(priority: 2, priorities: priorities)
    var obs3: IObserver<WeatherInfo> = PriorityDisplay(priority: 1, priorities: priorities)
    var obs4: IObserver<WeatherInfo> = PriorityDisplay(priority: 4, priorities: priorities)
    var obs5: IObserver<WeatherInfo> = PriorityDisplay(priority: 2, priorities: priorities)

    wd.registerObserver(priority: 3, observer: &obs1)
    wd.registerObserver(priority: 2, observer: &obs2)
    wd.registerObserver(priority: 1, observer: &obs3)
    wd.registerObserver(priority: 4, observer: &obs4)
    wd.registerObserver(priority: 2, observer: &obs5)

    wd.setMeasurements(temperature: 1, humidity: 2, pressure: 3)

    XCTAssertEqual(expected, priorities.value)
  }
}
