import Foundation

class ModelDuck : Duck
{
  init() {
    super.init(flyBehavior: FlyNoWay(), quackBehavior: QuackBehavior(), danceBehavior: NoDance())
  }
  
  override func display() {
    print("I'm model duck")
  }
}
