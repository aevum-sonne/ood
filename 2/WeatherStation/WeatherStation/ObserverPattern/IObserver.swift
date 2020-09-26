//
//  Observer.swift
//  WeatherStation
//
//  Created by User on 20.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class IObserver<T>: Equatable
{
  private var identifier: UUID

  private static func getUniqueIdentifier() -> UUID {
    return UUID()
  }

  static func == (lhs: IObserver, rhs: IObserver) -> Bool {
    return lhs.identifier == rhs.identifier
  }

  required init() {
    self.identifier = IObserver.getUniqueIdentifier()
  }
  
  func update(data: inout T) {}
}
