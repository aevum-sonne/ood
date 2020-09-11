import Foundation

protocol IFlyBehavior : class
{
  func fly() -> Void
}

class FlyWithWings : IFlyBehavior
{
  private(set) var flightsCount: Int = 0
  
  func fly() {
    flightsCount += 1
    print("I'm flying with wings!! I've \(flightsCount) flights already!!")
  }
}

class FlyNoWay : IFlyBehavior
{
  func fly() {}
}
