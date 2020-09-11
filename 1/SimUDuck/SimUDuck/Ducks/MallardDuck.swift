import Foundation

class MallardDuck : Duck
{
  init() {
    super.init(flyBehavior: FlyWithWings(), quackBehavior: QuackBehavior(), danceBehavior: DanceWaltz())
  }
  
  override func display() {
    print("I'm mallard duck")
  }
}
