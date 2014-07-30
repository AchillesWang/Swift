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











