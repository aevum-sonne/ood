//
//  Observer.swift
//  WeatherStation
//
//  Created by User on 16.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class Observable<T> : IObservable<T>
{
  typealias ObserverType = IObserver<T>
  
  var observers: [ObserverType] = []
  
  func registerObserver(observer: inout ObserverType) {
    observers.insert(observer, at: 0)
  }
  
  func removeObserver(observer: inout ObserverType) {
    if let index = observers.firstIndex(of: observer) {
      observers.remove(at: index)
    }
  }
  
  override func notifyObservers() {
    var data = getChangedData()
    
    observers.forEach {observer in
      observer.update(data: &data)
    }
  }
  
  func getChangedData() -> T { return T.self as! T }
}
