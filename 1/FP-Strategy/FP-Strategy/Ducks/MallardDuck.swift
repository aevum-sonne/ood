import Foundation

class MallardDuck : Duck
{
  init() {
    super.init(flyBehavior: flyWithWings(), quackBehavior: doubleQuack, danceBehavior: danceWaltz)
  }

  override func display() {
    print("I'm mallard duck")
  }
}
