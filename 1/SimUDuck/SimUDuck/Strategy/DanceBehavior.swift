import Foundation

protocol IDanceBehavior : class
{
  func dance() -> Void
}

class DanceWaltz : IDanceBehavior
{
  func dance() {
    print("I'm waltzing!")
  }
}

class DanceMinuet : IDanceBehavior
{
  func dance() {
    print("I'm dancing minuet!")
  }
}

class NoDance : IDanceBehavior
{
  func dance() {}
}
