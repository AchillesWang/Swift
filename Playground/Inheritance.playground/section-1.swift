// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
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
}

let someVehicle = Vehicle()

var str1 = someVehicle.description()

let someBicycle = Bicycle()

var str2 = someBicycle.description()

let someTandem = Tandem()

var str3 = someTandem.description()
