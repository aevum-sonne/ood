//
//  Observer.swift
//  WeatherStation
//
//  Created by User on 20.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class IObserver<T>
{
  func update(data: inout T) {}
}
