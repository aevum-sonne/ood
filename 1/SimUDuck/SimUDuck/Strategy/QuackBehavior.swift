import Foundation

protocol IQuackBehavior : class
{
  func quack() -> Void
}

class QuackBehavior : IQuackBehavior
{
  func quack() {
    print("Quack Quack!!!")
  }
}

class SqueakBehavior : IQuackBehavior
{
  func quack() {
    print("Squeak!!!")
  }
}

class MuteQuackBehavior : IQuackBehavior
{
  func quack() {}
}
