//
//  IObserver.swift
//  WeatherStationPro
//
//  Created by User on 26.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class IObserver<T, Event> where Event: Hashable
{
  func update(data: inout T, event: Event) {}
}
