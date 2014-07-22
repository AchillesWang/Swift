//
//  main.swift
//  Function
//
//  Created by WangXiaoXiang on 14-7-16.
//  Copyright (c) 2014年 Next. All rights reserved.
//

import Foundation
    
//    func chooseStepFunction(backwards:Bool) ->(Int)->Int{
//        func setpForward(input:Int)->Int {return input+1}
//        func setpBackward(input:Int)->Int {return input-1}
//        return backwards ? setpBackward: setpForward
//    }
//    
//    var currentValue = -4
//    let moveNearerToZero = chooseStepFunction(currentValue > 0)
//    while currentValue != 0 {
//        println("\(currentValue)...")
//        currentValue = moveNearerToZero(currentValue)
//    }
//    
//    
//    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//    
//    func backwards(str1:String,str2:String)->Bool{
//        return str1>str2;
//    }
//    
//    var reversed = sorted(names, backwards);
//    
//    println("1. \(reversed)....")
//    
//    var reversed2 = sorted(names, {(s1:String, s2:String)->Bool in return s1<s2});
//    
//    println("2. \(reversed2)....")
//    
//    var reversed2_1 = sorted(names){(s1:String, s2:String)->Bool in return s1>s2};
//    
//    println("2_1. \(reversed2_1)....")
//    
//    
//    
//    var reversed3 = sorted(names, {s1, s2 in return s1>s2});
//    
//    println("3. \(reversed3)....")
//    
//    var reversed3_1 = sorted(names){s1, s2 in return s1<s2};
//    
//    println("3_1. \(reversed3_1)....")
//    
//    var reversed4 = sorted(names, {s1, s2 in  s1<s2});
//    
//    println("4. \(reversed4)....")
//    
//    var reversed5 = sorted(names, {$0 > $1});
//    
//    println("5. \(reversed5)....")
//    
//    var reversed6 = sorted(names, <);
//    
//    println("6. \(reversed6)....")
//    
//    var reversed7 = sorted(names){$0>$1};
//    
//    println("7. \(reversed7)....")
//    
//    
//    func someFunctionThatTakesAClosure(closure:()->()){
//        
//    }
//    
//    someFunctionThatTakesAClosure({
//        
//        });
//    someFunctionThatTakesAClosure(){
//        
//    };
//    
//    
//    let digitNames = [
//        0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
//        5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
//    ]
//    
//    let numbers = [16, 58, 510]
//    
//    println("numbers-->\(numbers)...")
//    
//    let strings = numbers.map{
//        (var number) -> String in
//        var output = "";
//        while number > 0{
//            output = digitNames[number % 10]! + output
//            number /= 10
//        }
//        return output
//    };
//    
//    println("strings-->\(strings)...")
//    
//    let digitNames_CN = [
//        0: "零", 1: "一", 2: "二",   3: "三", 4: "四",
//        5: "五", 6: "六", 7: "七", 8: "八", 9: "九"
//    ]
//    
//    let numbers_CN = [16, 58, 510]
//    
//    let strings_CN = numbers_CN.map({(var number) -> String in
//        var output = ""
//        while number > 0{
//            output = digitNames_CN[number % 10]! + output
//            number /= 10
//        }
//        return output
//        })
//    
//    println("strings_CN-->\(strings_CN)...")
//    //I, 1 】II, 2】 III, 3】 IV, 4 】V, 5 】VI, 6】 VII, 7】 VIII,8 】IX, 9
//    let digitNames_RM = [
//        0: "0", 1: "I", 2: "II",   3: "III", 4: "IV",
//        5: "VI", 6: "VII", 7: "VIII", 8: "IX", 9: "XXX"
//    ]
//    
//    let numbers_RM = [16, 58, 510]
//    
//    func mapDict(var number:Int) -> String{
//        
//        let digitNames_RM = [
//            0: "0", 1: "I", 2: "II",   3: "III", 4: "IV",
//            5: "VI", 6: "VII", 7: "VIII", 8: "IX", 9: "XXX"
//        ]
//        
//        var output = ""
//        while number > 0{
//            output = digitNames_RM[number % 10]! + " " + output
//            number /= 10
//        }
//        return output;
//    }
//    
//    let strings_RM = numbers_RM.map(mapDict);
//    println("strings_RM-->\(strings_RM)...")



//闭包的引用
//func makeIncrementor(forIncrement amount:Int) ->()->Int{
//    var runningTotal = 0
//    func incrementor() -> Int {
//        runningTotal += amount;
//        return runningTotal;
//    }
//    return incrementor
//}
//
//let incrementByTen = makeIncrementor(forIncrement: 10)
//
//incrementByTen()
//incrementByTen()
//var value =  incrementByTen()
//println("incrementByTen--->\(value)")
//let incrementBySeven = makeIncrementor(forIncrement: 7)
//
//var value3  = incrementBySeven()
//var value2 = incrementByTen();
//println("incrementByTen--->\(value2),\(value3)")
//
//let alsoIncrementByTen = incrementByTen
//var value4 = alsoIncrementByTen();
//println("incrementByTen--->\(value4)")
 