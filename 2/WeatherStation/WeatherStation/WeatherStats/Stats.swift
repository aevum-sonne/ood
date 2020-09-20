//
//  Stats.swift
//  WeatherStation
//
//  Created by User on 20.09.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class Stats
{
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
  
  init(type: String) {
    self.type = type
  }
  
  public var minData = Double.greatestFiniteMagnitude
  public var maxData = -Double.greatestFiniteMagnitude
  public var avgData: Double = 0
  
  private var accData: Double = 0
  private var countAcc: UInt64 = 0
  private var type: String
}
