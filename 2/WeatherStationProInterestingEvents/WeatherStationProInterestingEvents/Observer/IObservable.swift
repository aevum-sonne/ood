//
//  IObservable.swift
//  WeatherStationPro
//
//  Created by User on 26.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class IObservable<T>
{
  func registerObserver(observer: inout T) {}
  func removeObserver(observer: inout T) {}
  
  func notifyObservers() {}
}
