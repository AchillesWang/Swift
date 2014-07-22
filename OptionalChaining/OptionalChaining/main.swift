//
//  main.swift
//  OptionalChaining
//  可选链接
//  Created by WangXiaoXiang on 14-7-22.
//  Copyright (c) 2014年 Next. All rights reserved.
//


// ?为可选
// !为强制解析

import Foundation

class Person {
    var residence: Residence?
}

class Room{
    let name: String
    init(name: String) { self.name = name }
}

class Address{
    var buildingName:String?
    var buildingNumber:String?
    var street:String?
    func buildingIdentifier() -> String?{
        if buildingName {
            return buildingName
        } else if buildingNumber {
            return buildingNumber
        } else {
            return nil
        }
    }
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms:Int{
        return rooms.count
    }
    subscript(i:Int)->Room{
        return rooms[i]
    }
    func printNumberOfRooms(){
        println("The number of rooms is \(numberOfRooms)")
    }
    var address:Address?
}
let john = Person()
if let roomCount = john.residence?.numberOfRooms {
    println("John's residence has \(roomCount) room(s).")
} else {
    println("Unable to retrieve the number of rooms.")
}

if john.residence?.printNumberOfRooms(){  // 返回值为nil
    println("It was possible to print the number of rooms.")
}else{
    println("It was not possible to print the number of rooms.")
}


let johnsHouse = Residence()
johnsHouse.rooms += Room(name: "Living Room")
johnsHouse.rooms += Room(name: "Kitchen")
john.residence = johnsHouse

if let firstRoomName = john.residence?[0].name{
    println("The first room name is \(firstRoomName).")
}else{
    println("Unable to retrieve the first room name.")
}



let johnsAddress = Address();
johnsAddress.buildingName = "The Larches"
johnsAddress.street = ""
john.residence!.address = johnsAddress;

if let johnsStreet = john.residence?.address?.street{
    println("John's street name is \(johnsStreet).")
}else{
    println("Unable to retrieve the address.")
}



if let buildingIdentifier = john.residence?.address?.buildingIdentifier(){
    println("John's building identifier is \(buildingIdentifier)")
}

if let upper = john.residence?.address?.buildingIdentifier()?.uppercaseString{
    println("John's uppercase building identifier is \(upper).")
}





//let john = Person()
//
//var num = john.residence?.numberOfRooms
//
//println("\(num)")
//
//john.residence = Residence();
//
//num = john.residence?.numberOfRooms
//
//println("\(num)")