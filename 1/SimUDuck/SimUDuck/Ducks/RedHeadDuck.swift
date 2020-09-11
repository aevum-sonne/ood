import Foundation

class RedHeadDuck : Duck
{
  init() {
    super.init(flyBehavior: FlyWithWings(), quackBehavior: QuackBehavior(), danceBehavior: DanceMinuet())
  }
  
  override func display() {
    print("I'm redhead duck")
  }
}
