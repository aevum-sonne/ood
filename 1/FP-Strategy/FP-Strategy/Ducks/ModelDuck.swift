import Foundation

class ModelDuck : Duck
{
  init() {
    super.init(flyBehavior: flyWithWings(), quackBehavior: doubleQuack, danceBehavior: danceWaltz)
  }
  
  override func display() {
    print("I'm model duck")
  }
}
