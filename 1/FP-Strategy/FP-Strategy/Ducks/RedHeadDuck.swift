import Foundation

class RedHeadDuck : Duck
{
  init() {
    super.init(flyBehavior: flyWithWings(), quackBehavior: doubleQuack, danceBehavior: danceMinuet)
  }

  override func display() {
    print("I'm redhead duck")
  }
}
