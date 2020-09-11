import Foundation

typealias FlyBehavior = () -> Void

func flyWithWings() -> FlyBehavior {
  var flightsCount: Int = 0
  
  func flyCounter() {
    flightsCount += 1
    print("I'm flying with wings!! I've \(flightsCount) flights already!!")
  }
  
  return flyCounter
}

func flyNoWay() {}
