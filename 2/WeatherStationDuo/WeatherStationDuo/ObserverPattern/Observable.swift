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
  
  // Autosorted elements by priority
  private var observers: [PriorityObserverType] = [] {
    didSet {
      observers.sort { (lhs: PriorityObserverType, rhs: PriorityObserverType) -> Bool in
        return lhs.priority < rhs.priority
      }
    }
  }
  
  func registerObserver(priority: UInt64, observer: inout ObserverType) {
    observers.insert(PriorityObserverType(priority: priority, observer: observer), at: 0)
  }
  
  func removeObserver(observer: inout ObserverType) {
    if let index = observers.firstIndex(where: { $0.observer == observer }) {
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
