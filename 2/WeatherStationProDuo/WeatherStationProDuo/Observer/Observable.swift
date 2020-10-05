//
//  Observable.swift
//  WeatherStationProDuo
//
//  Created by User on 29.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

fileprivate struct ObserverWithPriority<T>
{
  var priority: UInt64
  var observer: IObserver<T>
}

class Observable<T> : IObservable<T>
{
  typealias ObserverType = IObserver<T>
  fileprivate typealias PriorityObserverType = ObserverWithPriority<T>
  
  private var observers: [PriorityObserverType] = []
  
  func registerObserver(priority: UInt64, observer: inout ObserverType) {
    if let index = observers.firstIndex(where: { $0.priority > priority }) {
      observers.insert(PriorityObserverType(priority: priority, observer: observer), at: index)
    }
    else {
      observers.append(PriorityObserverType(priority: priority, observer: observer))
    }
  }
  
  override func notifyObservers() {
    var data = getChangedData()
    
    observers.forEach {element in
      element.observer.update(data: &data, observable: self)
    }
  }
  
  func getChangedData() -> T { return T.self as! T }
}
