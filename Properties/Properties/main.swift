//
//  main.swift
//  Properties
//
//  Created by WangXiaoXiang on 14-7-16.
//  Copyright (c) 2014年 Next. All rights reserved.
//

import Foundation

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3);

rangeOfThreeItems.firstValue = 100



let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4);
//rangeOfFourItems.firstValue = 100 //无法修改应为rangeOfFourItems是常量
/*
    这种行为是由于结构体（struct）属于值类型。当值类型的实例被声明为常量的时候，它的所有属性也就成了常量。

    属于引用类型的类（class）则不一样，把一个引用类型的实例赋给一个常量后，仍然可以修改实例的变量属性。
*/

class DataImporter {
    /*
    DataImporter 是一个将外部文件中的数据导入的类。
    这个类的初始化会消耗不少时间。
    */
    var fileName = "data.txt"
    // 这是提供数据导入功能
}

class DataManager {
    @lazy var importer = DataImporter() //延迟属性
    var data = [String]()
    // 这是提供数据管理功能
}

let manager = DataManager()
manager.data += "Some data"
manager.data += "Some more data"

println("\(manager.importer.fileName),\(manager.data)")

struct Point{
    var x = 0.0,y=0.0
}
struct Size{
    var width = 0.0, height = 0.0
}
struct Rect{
    var origin = Point()
    var size = Size()
    var center:Point{
        get{
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set{
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10, height: 10))


var center = square.center;

println("square.center.x:\(center.x),y:\(center.y)\n")

println("square.origin.x:\(square.origin.x),y:\(square.origin.y)")
square.center = Point(x: 10, y: 10)

println("square.origin.x:\(square.origin.x),y:\(square.origin.y)")


struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    //只读属性
    var volume: Double{
        return width*height*depth;
    }
}

let fourByFiveByTwo = Cuboid(width: 4, height: 5, depth: 2);
println("volume:\(fourByFiveByTwo.volume)")

class StepCounter {
    var totalSteps :Int = 0{
        willSet{
            println("About to set totalSteps to \(newValue)");
        }
        didSet{
            if totalSteps > oldValue{
                println("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()

stepCounter.totalSteps = 200
stepCounter.totalSteps = 201


struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
    // 这里返回一个 Int 值
        return 42
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
    // 这里返回一个 Int 值
        return 100
    }
}
class SomeClass {
    class var computedTypeProperty: String {
    // 这里返回一个 Int 值
        return "汪潇翔是帅哥!"
    }
}

println(SomeClass.computedTypeProperty)
// 输出 "42"

println(SomeStructure.storedTypeProperty)
// 输出 "Some value."
SomeStructure.storedTypeProperty = "Another value."
println(SomeStructure.storedTypeProperty)
// 输出 "Another value.”


struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
    didSet {
        if currentLevel > AudioChannel.thresholdLevel {
            // 将新电平值设置为阀值
            currentLevel = AudioChannel.thresholdLevel
        }
        if currentLevel > AudioChannel.maxInputLevelForAllChannels {
            // 存储当前电平值作为新的最大输入电平
            AudioChannel.maxInputLevelForAllChannels = currentLevel
        }
    }
    }
}


var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
println(leftChannel.currentLevel)
// 输出 "7"
println(AudioChannel.maxInputLevelForAllChannels)
// 输出 "7"

rightChannel.currentLevel = 11
println(rightChannel.currentLevel)
// 输出 "10"
println(AudioChannel.maxInputLevelForAllChannels)
// 输出 "10"
