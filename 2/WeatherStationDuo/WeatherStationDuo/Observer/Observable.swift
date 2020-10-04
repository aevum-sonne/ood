//
//  Observer.swift
//  WeatherStation
//
//  Created by User on 16.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

struct ObserverWithPriority<T>
{
  var priority: UInt64
  var observer: IObserver<T>
}

class Observable<T> : IObservable<T>
{
  typealias ObserverType = IObserver<T>
  typealias PriorityObserverType = ObserverWithPriority<T>
  
  private var observers: [PriorityObserverType] = []
  
  func registerObserver(priority: UInt64, observer: inout ObserverType) {
    if let index = observers.firstIndex(where: { $0.priority > priority }) {
      observers.insert(PriorityObserverType(priority: priority, observer: observer), at: index)
    }
    else {
      observers.append(PriorityObserverType(priority: priority, observer: observer))
    }
  }
  
  func removeObserver(observer: inout ObserverType) {
    if let index = observers.firstIndex(where: { $0.observer === observer }) {
      observers.remove(at: index)
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
