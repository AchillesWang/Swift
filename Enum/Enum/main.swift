//
//  main.swift
//  Enum
//
//  Created by WangXiaoXiang on 14-7-16.
//  Copyright (c) 2014年 Next. All rights reserved.
//

import Foundation

enum CompassPoint {
    case North
    case South
    case East
    case West
}

enum Planet:Int{
    case Mercury = 1, Venus/* 2 */, Earth/* 3 */, Mars, Jupiter, Saturn, Uranus, Neptune
}

enum Barcode {
    case UPCA(Int,Int,Int)
    case QRCode(String)
}
enum ASCIIControlCharacter:Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

var directionToHead = CompassPoint.West;

directionToHead = .South

switch directionToHead {
    case .North:
        println("Lots of planets have a north")
    case .South:
        println("Watch out for penguins")
    case .East:
        println("Where the sun rises")
    case .West:
        println("Where the skies are blue")
}

let somePlanet = Planet.Earth
switch somePlanet{
    case .Earth:
        println("适合人类居住!")
    default:
        println("不适合人类居住!")
}

var waHaHaBarcode = Barcode.UPCA(8, 85909_51226, 3)


switch waHaHaBarcode{
    case .UPCA(let numberSystem,let identifier,let check):
        println("UPC-A with value of \(numberSystem), \(identifier), \(check).")
    case .QRCode(let productCode):
        println("QR code with value of \(productCode).")
}
waHaHaBarcode = .QRCode("www.baidu.com")

switch waHaHaBarcode{
case let .UPCA( numberSystem, identifier, check):
    println("UPC-A with value of \(numberSystem), \(identifier), \(check).")
case let .QRCode( productCode):
    println("QR code with value of \(productCode).")
}

let earthsOrder = Planet.Earth.toRaw();
println("earthsOrder-->\(earthsOrder)")


let possiblePlanet = Planet.fromRaw(7)
println("possiblePlanet-->\(possiblePlanet!.toRaw())")

let positionToFind = 7

if let somePlanet = Planet.fromRaw(positionToFind) {
    switch somePlanet {
        case .Earth:
            println("罪恶之谷...")
        default:
            println("世外桃源...")
    }
}else{
    println("超出了太阳系!")
}

//if let somePlanet = Planet.fromRaw(positionToFind) {
//    switch somePlanet {
//    case .Earth:
//        println("Mostly harmless")
//    default:
//        println("Not a safe place for humans")
//    }
//} else {
//    println("There isn't a planet at position \(positionToFind)")
//}


