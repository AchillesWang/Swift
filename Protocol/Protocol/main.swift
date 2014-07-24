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

println("sb110 fullName-->\()")

