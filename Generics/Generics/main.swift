//
//  main.swift
//  Generics
//
//  Created by WangXiaoXiang on 14/8/4.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

import Foundation

func swapObject<T>(inout a:T,inout b:T){
    let tmp = a;
    a = b;
    b = tmp;
}


func swapObjectNOI<T>(var a:T,var b:T){
    let tmp = a;
    a = b;
    b = tmp;
}


var a = 10
var b = 99

println("a:\(a),b:\(b)")
swapObjectNOI(a,b);
println("a:\(a),b:\(b)")
swapObject(&a, &b)
println("a:\(a),b:\(b)")

var aStr = "汪潇翔"
var bStr = "汪潇凯"
println("aStr:\(aStr),bStr:\(bStr)")
swapObject(&aStr, &bStr)
println("aStr:\(aStr),bStr:\(bStr)")

struct Stack<T>{
    var items = [T]()
    //mutating 表示可以修改结构体中的内容
    mutating func push(item:T){
        items.append(item)
    }
    mutating func pop() -> T{
        return items.removeLast();
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("汪潇翔")
stackOfStrings.push("汪潇凯")
stackOfStrings.push("单志勇")
stackOfStrings.push("冯哲")
stackOfStrings.push("胡欣")
stackOfStrings.push("韩庆辉")


println("items:\(stackOfStrings.items)")



