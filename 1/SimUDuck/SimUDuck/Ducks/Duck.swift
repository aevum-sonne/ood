import Foundation

class Duck
{
  private(set) var flyBehavior : IFlyBehavior!
  private(set) var quackBehavior : IQuackBehavior!
  private(set) var danceBehavior : IDanceBehavior!
  
  func setFlyBehavior(flyBehavior: IFlyBehavior) {
    self.flyBehavior = flyBehavior
  }
  
  func setQuackBehavior(quackBehavior: IQuackBehavior) {
    self.quackBehavior = quackBehavior
  }
  
  func setDanceBehavior(danceBehavior: IDanceBehavior) {
    self.danceBehavior = danceBehavior
  }
  
  init(flyBehavior: IFlyBehavior, quackBehavior: IQuackBehavior, danceBehavior: IDanceBehavior) {
    setFlyBehavior(flyBehavior: flyBehavior)
    setQuackBehavior(quackBehavior: quackBehavior)
    setDanceBehavior(danceBehavior: danceBehavior)
  }
  
  func quack() {
    quackBehavior.quack()
  }
  
  func fly() {
    flyBehavior.fly()
  }
  
  func dance() {
    danceBehavior.dance()
  }
  
  func swim() {
    print("I'm swimming")
  }
  
  func display() -> Void {}
}
