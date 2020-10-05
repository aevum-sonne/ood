//
//  WindStats.swift
//  WeatherStationProDuo
//
//  Created by User on 29.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class WindStats
{
  func updateStats(data wind: Wind) {
    countAcc += 1
        
    findAverageDirection(direction: wind.direction)
    findAverageSpeed(speed: wind.speed)
    
    printStats()
  }
  
  private func findAverageDirection(direction: Double) {
    let degree = 180 / Double.pi
    let radian = 1 / degree
    
    // Sum current sin, cos
    avgCos += cos(direction * radian)
    avgSin += sin(direction * radian)
    
    avgDirection = atan2(avgSin / Double(countAcc), avgCos / Double(countAcc)) * degree
  }
  
  private func findAverageSpeed(speed: Double) {
    avgSpeed = (avgSpeed + speed) / Double(countAcc)
  }
  
  private func printStats() {
    print("Average Wind Speed \(avgSpeed)")
    print("Average Wind Direction \(avgDirection)")
    print("----------------")
  }
  
  private var avgCos: Double = 0
  private var avgSin: Double = 0
  private var avgDirection: Double = 0
  private var avgSpeed: Double = 0
  
  private var countAcc: UInt64 = 0
}
