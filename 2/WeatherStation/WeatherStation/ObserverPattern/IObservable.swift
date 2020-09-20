//
//  IObservable.swift
//  WeatherStation
//
//  Created by User on 20.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class IObservable<T> {
  func registerObserver(observer: inout T) {}
  func removeObserver(observer: inout T) {}
  
  func notifyObservers() {}
}
