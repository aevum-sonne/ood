import Foundation

typealias Behavior = () -> Void

class Duck
{
  private(set) var flyBehavior : Behavior!
  private(set) var quackBehavior : Behavior!
  private(set) var danceBehavior : Behavior!
  
  func setFlyBehavior(flyBehavior: @escaping Behavior) {
    self.flyBehavior = flyBehavior
  }
  
  func setQuackBehavior(quackBehavior: @escaping Behavior) {
    self.quackBehavior = quackBehavior
  }
  
  func setDanceBehavior(danceBehavior: @escaping Behavior) {
    self.danceBehavior = danceBehavior
  }
  
  init(flyBehavior: @escaping Behavior, quackBehavior: @escaping Behavior, danceBehavior: @escaping Behavior) {
    setFlyBehavior(flyBehavior: flyBehavior)
    setQuackBehavior(quackBehavior: quackBehavior)
    setDanceBehavior(danceBehavior: danceBehavior)
  }
  
  func quack() {
    quackBehavior()
  }
  
  func fly() {
    flyBehavior()
  }
  
  func dance() {
    danceBehavior()
  }

  func swim() {
    print("I'm swimming")
  }

  func display() {}
}
