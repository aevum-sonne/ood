//
//  IObserver.swift
//  WeatherStationProDuo
//
//  Created by User on 29.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class IObserver<T>
{
  func update(data: inout T, observable: IObservable<T>) {}
}
