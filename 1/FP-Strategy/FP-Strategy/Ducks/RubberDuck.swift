import Foundation

class RubberDuck : Duck
{
  init() {
    super.init(flyBehavior: flyNoWay, quackBehavior: squeak, danceBehavior: noDance)
  }

  override func display() {
    print("I'm rubber duck")
  }
}
