import Foundation

class DecoyDuck : Duck
{
  init() {
    super.init(flyBehavior: flyNoWay, quackBehavior: muteQuack, danceBehavior: noDance)
  }

  override func display() {
    print("I'm decoy duck")
  }
}
