import Foundation

class RubberDuck : Duck
{
  init() {
    super.init(flyBehavior: FlyNoWay(), quackBehavior: SqueakBehavior(), danceBehavior: NoDance())
  }
  
  override func display() {
    print("I'm rubber duck")
  }
}
