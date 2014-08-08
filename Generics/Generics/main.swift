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


func findStringIndex(array:[String],valueToFind:String) -> Int?{
    for (index,value) in enumerate(array){
        if value == valueToFind {
            return index
        }
    }
    return nil
}

func findIndex<T:Equatable>(array:[T],valueToFind:T) -> Int? {
    for (index,value) in enumerate(array){
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let strings = ["cat", "dog", "llama", "parakeet", "terrapin"];

let index = findStringIndex(strings, "terrapin")


let Nos = [1,2,3,4,5,6,7,8,9,0];

let index2 = findIndex(Nos, 0)

let index3 = findIndex([1,2,3], 3.1415926)


protocol Container{
    typealias ItemType
    mutating func append(item:ItemType)
    var count:Int{ get }
    subscript(i:Int) -> ItemType{ get }
}

struct IntStact:Container{
    var items = [Int]()
    mutating func append(item: Int){
        items.append(item)
    }
    var count:Int{
    return items.count
    }
    subscript(i:Int) -> Int{
        return items[i]
    }
}

struct Stact<T>:Container{
    var items = [T]()
    mutating func append(item: T){
        items.append(item)
    }
    var count:Int{
    return items.count
    }
    subscript(i:Int) -> T{
        return items[i]
    }
}

func allItemsMatch<c1:Container,c2:Container where c1.ItemType == c2.ItemType,c1.ItemType:Equatable>(someContainer:c1,anotherContainer:c2) -> Bool{
    // 检查两个Container的元素个数是否相同
    if someContainer.count != anotherContainer.count{
        return false
    }
    for i in 0...someContainer.count-1{
        if someContainer[i] != anotherContainer[i]{
            return false
        }
        
    }
    return true
}


var s1 = Stact<String>()
s1.append("wxx")
s1.append("wxk")
s1.append("qy")

var s2 = Stact(items: ["wxx","wxk","qy"])

let array = ["wxx","dl","rfs"]

println("s1:\(s1.items)")

let m1 = allItemsMatch(s1, s2)


if allItemsMatch(s1, s2){
    println("一样")
}else{
    println("不同")
}



