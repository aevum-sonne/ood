//
//  WindStats.swift
//  WeatherStationPro
//
//  Created by User on 26.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class WindStats
{
  func updateDirection(direction: Double) {
    countAcc += 1
        
    findAverageDirection(direction: direction)
    
    print("Average Wind Direction \(avgDirection)")
    print("----------------")
  }
  
  func updateSpeed(speed: Double) {
    countAcc += 1

    findAverageSpeed(speed: speed)
    
    print("Average Wind Speed \(avgSpeed)")
    print("----------------")
  }
  
  private func findAverageDirection(direction: Double) {
    let degree = 180 / Double.pi
    let radian = 1 / degree
    
    // Sum current sin, cos and divide on counter
    avgCos += cos(direction * radian)
    avgSin += sin(direction * radian)
    
    avgDirection = atan2(avgSin / Double(countAcc), avgCos / Double(countAcc)) * degree
  }
  
  private func findAverageSpeed(speed: Double) {
    avgSpeed = (avgSpeed + speed) / Double(countAcc)
  }
  
  private var avgCos: Double = 0
  private var avgSin: Double = 0
  private var avgDirection: Double = 0
  private var avgSpeed: Double = 0
  
  private var countAcc: UInt64 = 0
}
