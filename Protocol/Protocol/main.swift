//
//  main.swift
//  Protocol
//
//  Created by WangXiaoXiang on 14-7-23.
//  Copyright (c) 2014年 Next. All rights reserved.
//

import Foundation



protocol FullyNamed{
    var fullName:String{get}
}

struct Person:FullyNamed{
    var fullName:String
}

let wxx = Person(fullName: "汪潇翔");
//wxx.fullName = "hehe" //redonly
println("wxx.fullName:\(wxx.fullName)")

class Starship:FullyNamed{
    var name:String
    var prefix:String?
    init(name:String,prefix:String? = nil){
        self.name = name
        self.prefix = prefix
    }
    var fullName:String{
        get{
            return (prefix ? prefix! + " " : " ") + name
        }
    }
}

var sb110 = Starship(name: "sb", prefix: "110");

println("sb110 fullName-->\(sb110.fullName)")


protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}
class RandomNumber:RandomNumberGenerator{
    func random() -> Double {
        var r = arc4random()
        return Double(r);
    }
}

let generator = LinearCongruentialGenerator()
println("Here's a random number: \(generator.random())")
// 输出 : "Here's a random number: 0.37464991998171"
println("And another one: \(generator.random())")
// 输出 : "And another one: 0.729023776863283"

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case Off, On
    mutating func toggle() {
        switch self {
        case Off:
            self = On
        case On:
            self = Off
        }
    }
}
var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()
//lightSwitch 现在的值为 .On

class Dice{
    /* 面 */
    let sides:Int
    let generator:RandomNumberGenerator
    init(sides:Int,generator:RandomNumberGenerator){
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int{
        if generator is RandomNumber{
            return Int(generator.random() % Double(sides)) + 1;
        }else if generator is LinearCongruentialGenerator{
            return Int(generator.random() * Double(sides)) + 1
        }
        return 0;
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator());

for _ in 1...5{
    println("Random dice roll is \(d6.roll())")
}

protocol DiceGame{
    var dice:Dice{ get }
    var name:NSString{ get }
    func play()
}

protocol DiceGameDelegate{
    func gameDidStart(game: DiceGame)
    func game(game: DiceGame,didStartNewTurnWithDiceRoll diceRoll:Int)
    func gameDidEnd(game: DiceGame)
}

class SnakesAndLadders:DiceGame{
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: RandomNumber())
    let name:NSString = "蛇和梯子"
    var square = 0
    var board:[Int]
    init(){
        board = [Int](count: finalSquare+1, repeatedValue: 0)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate:DiceGameDelegate?
    func play(){
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare{
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll{
                case finalSquare:
                    break gameLoop
                case let newSquare where  newSquare > finalSquare:
                    println("超过了")
                    continue gameLoop
                default:
                    square += diceRoll
                    square += board[square]
                    println("跳到方格:\(square)")
            }
        }
        delegate?.gameDidEnd(self)
    }
}



class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders{
            println("已经开始一个新游戏:\(game.name)")
        }
         println("这个游戏使用了一个\(game.dice.sides)-面的🎲")
    }
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        ++numberOfTurns
        println("摇到一个 \(diceRoll)")
    }
    func gameDidEnd(game: DiceGame) {
         println("你一共使用了 \(numberOfTurns) 步到终点!")
    }
    
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()

protocol TextRepresentable{
    func asText()->String;
}

extension Dice:TextRepresentable{
    func asText()->String{
        return "A \(sides) - sided dice";
    }
}
println("asText:\(game.dice.asText())")


struct Hamster{
    var name:String
    func asText() -> String{
        return "A hamster named \(name)"
    }
}

extension Hamster:TextRepresentable{}

protocol PrettyTextRepresentable: TextRepresentable {
    func asPrettyText() -> String
}

<<<<<<< HEAD
extension SnakesAndLadders:PrettyTextRepresentable{
    func asPrettyText() -> String{
        var output = asText() + ":\n"
        for index in 1...finalSquare{
            switch board[index]{
                case let ladder where ladder>0:
                        output += "▲ "
                case let snake where snake<0:
                        output += "▼ "
                default:
                        output += "○ "
            }
            if(index%5==0){
                output += "\n"
            }
        }
        return output;
    }
    func asText() ->String{
        return self.name;
    }
}

println(game.asPrettyText());

<<<<<<< HEAD
//let simonTheHamster = Hamster(name: "Simon")
//
//let somethingTextRepresentable:TextRepresentable = simonTheHamster
//
//println(somethingTextRepresentable.asText());
//
//let things:[TextRepresentable] = [game.dice,somethingTextRepresentable]
//
//for thing in things {
//    println(thing.asText())
//}
=======
=======
>>>>>>> FETCH_HEAD
protocol Named{
    var name:String { get }
}
protocol Aged{
    var age:Int { get }
}
<<<<<<< HEAD

struct Persons:Named,Aged{
    var name:String
    var age:Int
}
func wishHappyBirthday(celebrator:protocol<Named,Aged>){
    println("name:\(celebrator.name),age:\(celebrator.age)");
=======

struct Persons:Named,Aged{
    var name:String
    var age:Int
}
func wishHappyBirthday(celebrator:protocol<Named,Aged>){
    println("name:\(celebrator.name),age:\(celebrator.age)");
}

var p = Persons(name: "汪潇翔", age: 10)

wishHappyBirthday(p)

@objc protocol HasArea{
    var area:Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
>>>>>>> FETCH_HEAD
}

var p = Persons(name: "汪潇翔", age: 10)

wishHappyBirthday(p)

@objc protocol HasArea{
    var area:Double { get }
}

<<<<<<< HEAD
class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}
>>>>>>> FETCH_HEAD


<<<<<<< HEAD
class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

<<<<<<< HEAD
class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}

let objects:[AnyObject] = [Circle(radius: 10),Country(area: 10000),Animal(legs: 1)];
=======
=======
>>>>>>> FETCH_HEAD
protocol Named{
    var name:String { get }
}
protocol Aged{
    var age:Int { get }
}

struct Persons:Named,Aged{
    var name:String
    var age:Int
}
func wishHappyBirthday(celebrator:protocol<Named,Aged>){
    println("name:\(celebrator.name),age:\(celebrator.age)");
}

var p = Persons(name: "汪潇翔", age: 10)
<<<<<<< HEAD

wishHappyBirthday(p)
=======

wishHappyBirthday(p)

@objc protocol HasArea{
    var area:Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}
>>>>>>> FETCH_HEAD

@objc protocol HasArea{
    var area:Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}
>>>>>>> FETCH_HEAD

for obj in objects{
    if let object = obj as? HasArea{
        println(object.area)
    }else{
        println("呵呵")
    }
}

<<<<<<< HEAD
=======
class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}

<<<<<<< HEAD
=======
=======
>>>>>>> FETCH_HEAD
class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}

<<<<<<< HEAD
>>>>>>> FETCH_HEAD
=======
>>>>>>> FETCH_HEAD
let objects:[AnyObject] = [Circle(radius: 10),Country(area: 10000),Animal(legs: 1)];

for obj in objects{
    if let object = obj as? HasArea{
        println(object.area)
    }else{
        println("呵呵")
    }
}

<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> FETCH_HEAD
=======
>>>>>>> FETCH_HEAD
=======
>>>>>>> FETCH_HEAD
@objc protocol CounterDataSource{
    @optional func incrementForCount(count:Int) -> Int
    @optional var fixedIncrement:Int { get }
}

@objc class Counter{
    var count = 0
    var dataSource:CounterDataSource!
    func increment(){
        if let amount = dataSource?.incrementForCount?(count){
            count += amount
        }else if let amount = dataSource?.fixedIncrement{
            count += amount
        }
    }
}
class ThreeSource:CounterDataSource{
    var fixedIncrement:Int{
        return 3;
    }
}

var counter = Counter();
counter.dataSource = ThreeSource();

for _ in 1...4{
    counter.increment();
    println("count:\(counter.count)")
}

class TowardsZeroSource: CounterDataSource {
    func incrementForCount(count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {
    counter.increment()
    println(counter.count)
}






