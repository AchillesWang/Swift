//
//  main.swift
//  Extensions
//
//  Created by WangXiaoXiang on 14-7-23.
//  Copyright (c) 2014年 Next. All rights reserved.
//

import Foundation

extension Double{
    var KM:Double{return self * 1_000.0}
    var M:Double{return self}
    var CM:Double{return self / 100.0}
    var MM:Double{return self / 1_000.0}
    var FT:Double{return self / 3.28084}
}

//let oneInch = 25.5.KM
//println("One inch is \(oneInch) meters")
//
//let threeFeet = 3.FT
//println("Three feet is \(threeFeet) meters")
//
//let aMarathon = 42.KM + 195.M
//println("马拉松的长度:\(aMarathon)米")


struct Size {
    var width = 0.0, height = 0.0
    func description() -> String?{
        return "width:\(width),height:\(height)"
    }
}
struct Point {
    var x = 0.0, y = 0.0
    func description() -> String?{
        return "x:\(x),y:\(y)"
    }
}
struct Rect {
    var origin = Point()
    var size = Size()
    func description() -> String?{
        return "["+"origin:\(origin.description()), size:\(size.description())"+"]"
    }
}

extension Rect{
    init(center:Point,size:Size){
        let originX = center.x - size.width/2;
        let originY = center.y - size.height/2;
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

//let defaultRect = Rect()
//let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
//    size: Size(width: 5.0, height: 5.0))
//
//let centerRect = Rect(center: Point(x: 5, y: 5), size: Size(width: 10, height: 10))
//
//println("defaultRect:\(defaultRect.description())")
//
//println("memberwiseRect:\(memberwiseRect.description())")
//
//println("centerRect:\(centerRect.description())")

extension Int{
    func repetitions(task:()->()){
        for i in 0...self{
            task()
        }
    }
    subscript(digitIndex:Int) -> Int{
        var decimalBase = 1
        for _ in 1...digitIndex{
             decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
//3.repetitions({
//        println("尼玛呵呵!")
//    })
//
//println("\(123456789[0])")

extension Character {
    enum Kind {
        case Vowel, Consonant, Other
    }
    var kind:Kind{
        switch String(self).lowercaseString{
            case "a", "e", "i", "o", "u":
                return .Vowel
            case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
            "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
                return .Consonant
            default:
                return .Other
        }
    }
}

func printLetterKinds(word: String) {
    println("'\(word)' is made up of the following kinds of letters:")
    for character in word {
        switch character.kind {
        case .Vowel:
            print("vowel ")
        case .Consonant:
            print("consonant ")
        case .Other:
            print("other ")
        }
    }
    print("\n")
}


printLetterKinds("wwdc-iOS8")



