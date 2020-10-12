//
//  Observable.swift
//  WeatherStationPro
//
//  Created by User on 26.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

struct ObserverWithPriority<T, Event> where Event : Hashable
{
  var priority: UInt64
  var observer: IObserver<T, Event>
  
  // For collection sorting
  static func <=(lhs: ObserverWithPriority<T, Event>, rhs: ObserverWithPriority<T, Event>) -> Bool {
    return lhs.priority <= rhs.priority
  }
}

class Observable<T, Event> : IObservable<T> where Event: Hashable
{
  typealias ObserverType = IObserver<T, Event>
  typealias PriorityObserverType = ObserverWithPriority<T, Event>
  
  private var eventsWithObservers: Dictionary<Event, [PriorityObserverType]> = [:]
  
  func registerObserver(priority: UInt64, observer: ObserverType, events: [Event]) {
    events.forEach { event in
      subscribeObserver(priority: priority, observer: observer, event: event)
    }
  }
  
  func subscribeObserver(priority: UInt64, observer: ObserverType, event: Event) {
    let observerWithPriority = ObserverWithPriority(priority: priority, observer: observer)

    if let index = eventsWithObservers[event]?.firstIndex(where: { observerWithPriority <= $0 }) {
      eventsWithObservers[event]!.insert(observerWithPriority, at: index)
    }
    // Not found element with higher priority, insert as last element
    else if eventsWithObservers[event] != nil {
      eventsWithObservers[event]!.append(observerWithPriority)
    }
    // No elements, create key and assign value
    else {
      eventsWithObservers[event] = [observerWithPriority]
    }
  }
  
  func unsubscribeObserver(observer: ObserverType, event: Event) {
    if let index = getObserverPosition(observer: observer, observers: eventsWithObservers[event]!) {
      eventsWithObservers[event]!.remove(at: index)
    }
  }
  
  func removeObserver(observer: ObserverType) {
    for (event, observers) in eventsWithObservers {
      if let index = getObserverPosition(observer: observer, observers: observers) {
        eventsWithObservers[event]!.remove(at: index)
      }
    }
  }
  
  private func getObserverPosition(observer: ObserverType, observers: [PriorityObserverType]) -> Int? {
    return observers.firstIndex(where: { $0.observer === observer })
  }
  
  func notifyObservers(eventsToUpdate: [Event]) {
    var data = getChangedData()
    
    // Call update on all stored events
    for (event, eventObservers) in eventsWithObservers where eventsToUpdate.contains(event) {
      eventObservers.forEach { observerWithPriority in
        observerWithPriority.observer.update(data: &data, event: event)
      }
    }
  }
  
  func getChangedData() -> T { return T.self as! T }
}
