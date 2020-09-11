import Foundation

class DecoyDuck : Duck
{
  init() {
    super.init(flyBehavior: FlyNoWay(), quackBehavior: MuteQuackBehavior(), danceBehavior: NoDance())
  }
  
  override func display() {
    print("I'm decoy duck")
  }
}
