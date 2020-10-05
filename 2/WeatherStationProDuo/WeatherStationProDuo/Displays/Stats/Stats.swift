//
//  Stats.swift
//  WeatherStationProDuo
//
//  Created by User on 29.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class Stats
{
  required init(type: String) {
    self.type = type
  }
  
  func updateStats(data: Double) {
    if (minData > data) {
      minData = data
    }
    
    if (maxData < data) {
      maxData = data
    }
    
    findAverageData(data: data)
    
    printStats()
  }
  
  private func findAverageData(data: Double) {
    accData += data
    countAcc += 1
    
    avgData = accData / Double(countAcc)
  }
  
  private func printStats() {
    print("Max \(type) \(maxData)")
    print("Min \(type) \(minData)")
    print("Average \(type) \(avgData)")
    print("----------------")
  }
  
  private var type: String
  
  private var minData = Double.greatestFiniteMagnitude
  private var maxData = -Double.greatestFiniteMagnitude
  
  private var avgData: Double = 0
  private var accData: Double = 0
  private var countAcc: UInt64 = 0
}
