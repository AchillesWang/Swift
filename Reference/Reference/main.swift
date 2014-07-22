//
//  main.swift
//  Reference
//
//  Created by WangXiaoXiang on 14-7-21.
//  Copyright (c) 2014年 Next. All rights reserved.
//

import Foundation
class Person {
    let name: String
    var apartment: Apartment?
    init(name: String) {
        self.name = name
        println("\(name) is being initialized")
    }
    deinit {
        println("\(name) is being deinitialized")
    }
}

class Apartment {
    let number: Int
    init(number: Int) { self.number = number }
    weak var tenant: Person?
    deinit {
        println("Apartment #\(number) is being deinitialized")
    }
}

class Customer{
    let name:String
    var card:CreditCrad?
    init(name:String){
        self.name = name
    }
    deinit { println("\(name) is being deinitialized") }
}
class CreditCrad{
    let number:Int
    unowned let customer:Customer
    init(number:Int,customer:Customer){
        self.number = number
        self.customer = customer
    }
    deinit { println("Card #\(number) is being deinitialized") }
}


class Country{
    let name:String
    let capitalCity:City!
    init(name:String, capitalName:String){
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
    deinit{
        println("\(name) 已经被攻陷,")
    }
}
class City{
    let name:String
    unowned let country:Country
    init(name:String, country:Country){
        self.name = name
        self.country = country
    }
    deinit{
        println("\(name) 一片混乱!");
    }
}

//var China:Country? = Country(name: "China", capitalName: "BeiJing_CN")
//China = nil
//
//var USA:Country? = Country(name: "America", capitalName: "Washington")
//USA = nil

class House{
    let address:String
    unowned var owner:Human
    init(address:String,owner:Human){
        self.address = address
        self.owner = owner
        self.owner.house = self;
    }
    deinit{
        println("\(address) 将要被注销...")
    }
}
class Human{
    var name:String
    var house:House!
    init(name:String){
        self.name = name
    }
    deinit{
        println("\(name) 见上帝去了")
    }
    func toString() -> String{
        if house{
            return "name:\(name),house:\(house?.address)"
        }else{
            return "name:\(name),house:?"
        }
    }
}
//
//var wxx:Human? = Human(name: "W-X-X")
//
//var qy:Human? = Human(name: "Q-Y")
//
//var kfA:Human? = Human(name: "开发商A")
//
//var houseDS:House? = House(address: "北京昌平区龙锦三街38-18号", owner:kfA!)
//
//houseDS!.owner = qy!
//qy!.house = houseDS!
//println(qy?.toString())
//
//kfA = nil


//println("\(houseDS!.owner.name)")

//var wxx:Customer? = Customer(name: "wxx")
//
//wxx!.card = CreditCrad(number: 123_456_789, customer: wxx!)
//
//wxx = nil
//
//var john: Person?
//var number73: Apartment?
//
//john = Person(name: "wxx")
//
//number73 = Apartment(number: 73)
//
//john!.apartment = number73;
//
//number73!.tenant = john
//
//
//john = nil;
//
//number73 = nil;


//var reference1: Person?
//var reference2: Person?
//var reference3: Person?
//
//reference1 = Person(name: "wxx")
//
//reference2 = reference1
//
//reference3 = reference2;
//
//reference1 = nil
//reference2 = nil
//reference3 = nil

class HTMLElement{
    let name:String
    let text:String?
    @lazy var asHTML:()->String = {
        [unowned self] in
        if let text = self.text{
            return "<\(self.name)>\(text)</\(self.name)>"
        }else{
            return "<\(self.name)/>"
        }
    }
    @lazy var asHTML2:String = {
        [unowned self] in
        if let text = self.text{
            return "<\(self.name)>\(text)</\(self.name)>"
        }else{
            return "<\(self.name)/>"
        }
    }()
    init(name:String,text:String? = nil){
        self.name = name
        self.text = text
    }
    deinit{
        println("\(name)  is being deinitialized!")
    }
}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")

println("\(paragraph!.asHTML())")


println("\(paragraph!.asHTML2)")


paragraph = nil
