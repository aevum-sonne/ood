import Foundation

func drawDuck(duck: Duck) -> Void {
  duck.display()
}

func playWithDuck(duck: Duck) -> Void {
  drawDuck(duck: duck)
  duck.quack()
  duck.fly()
  duck.dance()
  print("\n")
}

let mallardDuck = MallardDuck()
playWithDuck(duck: mallardDuck)

let redHeadDuck = RedHeadDuck()
playWithDuck(duck: redHeadDuck)

let rubberDuck = RubberDuck()
playWithDuck(duck: rubberDuck)

let decoyDuck = DecoyDuck()
playWithDuck(duck: decoyDuck)

let modelDuck = ModelDuck()
modelDuck.setFlyBehavior(flyBehavior: FlyWithWings())
modelDuck.setQuackBehavior(quackBehavior: SqueakBehavior())
modelDuck.setDanceBehavior(danceBehavior: DanceWaltz())
playWithDuck(duck: modelDuck)
modelDuck.fly()
modelDuck.fly()
modelDuck.quack()

// Change strategy
modelDuck.setFlyBehavior(flyBehavior: FlyNoWay())
modelDuck.setFlyBehavior(flyBehavior: FlyWithWings())
modelDuck.fly()
modelDuck.fly()
