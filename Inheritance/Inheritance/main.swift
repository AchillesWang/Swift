//
//  main.swift
//  Inheritance
//
//  Created by WangXiaoXiang on 14-7-18.
//  Copyright (c) 2014年 Next. All rights reserved.
//

import Foundation

/**
*  车辆
*/
class Vehicle{
    /**
    *  轮子
    */
    var numberOfWheels:Int = 0
    /**
    *  最大乘坐人数
    */
    var maxPassengers: Int = 0
    func description() -> String {
        return "\(numberOfWheels) wheels; up to \(maxPassengers) passengers"
    }
    
    init(){
        numberOfWheels = 0;
        maxPassengers = 1;
    }
}
/**
*  自行车
*/
class Bicycle:Vehicle{
    init() {//初始化器默认是不继承的
        super.init();
        numberOfWheels = 2;
        println("初始化-->Bicycle")
    }
}

class Tandem:Bicycle{
    init() {
        super.init()
        println("初始化-->Tandem")
        maxPassengers = 2 //没有super.init() 不让设置???
    }
}
class Car: Vehicle {
//    @final var speed: Double = 0.0  这样可以防止从写
    var speed: Double = 0.0
    init() {
        super.init()
        numberOfWheels = 4
        maxPassengers = 5
    }
    //@final override func description() -> String  这样可以防止从写
    override func description() -> String{
        return super.description() + "; traveling at \(speed) mph"
    }
}

class SpeedLimitedCar: Car {
    override var speed:Double{
        get{
            return super.speed
        }
        set{
            super.speed = min(newValue,40)
        }
    }
    
}

class AutomaticCar: Car {
    var gear = 1
    override var speed:Double{
        didSet{
            gear = Int(speed / 10.0) + 1
        }
    }
    override func description() -> String {
        return super.description() + "in gear \(gear)"
    }
}

let automatic = AutomaticCar()
automatic.speed = 35.0
println("AutomaticCar: \(automatic.description())")


//let limitedCar = SpeedLimitedCar()
//limitedCar.speed = 60.0
//println("SpeedLimitedCar: \(limitedCar.description())")

//var car = Car();
//
//car.speed = 100
//
//println("Car: \(car.description())")

//let someVehicle = Vehicle()
//
//var str1 = someVehicle.description()
//
//let someBicycle = Bicycle()
//
//println("Bicycle: \(someBicycle.description())")
//
//
//let someTandem = Tandem()
//
//
//println("someTandem: \(someTandem.description())")




