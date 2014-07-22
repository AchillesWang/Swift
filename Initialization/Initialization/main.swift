//
//  main.swift
//  Initialization
//
//  Created by WangXiaoXiang on 14-7-18.
//  Copyright (c) 2014年 Next. All rights reserved.
//

import Foundation

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

//var f = Fahrenheit()
//println("The default temperature is \(f.temperature)° Fahrenheit")

struct Celsius {
    var temperatureInCelsius: Double = 0.0
    init(fromFahrenheit fahrenheit:Double){
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

struct Color{
    let red = 0.0,green = 0.0, blue = 0.0
    init(red:Double,green:Double,blue:Double){
        self.red = red;
        self.green = green;
        self.blue = blue;
    }
    init(_ red:Double,_ green:Double,_ blue:Double){
        self.red = red;
        self.green = green;
        self.blue = blue;
    }
}

//var color = Color(red:0.5, green: 0.5, blue: 0.5);
//
//var color2 = Color(1,1,1)
//
//let boilingPointOfWater = Celsius(fromFahrenheit: 210)
//
//let freezingPointOfWater = Celsius(fromKelvin: 273.15)

struct Size {
    var width = 0.0, height = 0.0
    func toString()->String{
        return "[width:\(width), height:\(height)]";
    }
}
struct Point {
    var x = 0.0, y = 0.0
    func toString()->String{
        return "[x:\(x), y:\(y)]";
    }
}

struct Rect {
    var origin = Point()
    var size = Size()
    init(){}
    init(origin:Point,size:Size){
        self.origin = origin
        self.size = size
    }
    init(center:Point,size:Size){
        let originX = center.x - size.width/2
        let originY = center.y - size.height/2
        self.init(origin:Point(x: originX, y: originY),size:size)
    }
    func toString()->String{
        return "{origin:\(origin.toString()), size:\(size.toString())}";
    }
}

//let basicRect = Rect()
//
//let originRect = Rect(origin: Point(x: 0, y: 0),
//                        size: Size(width: 100, height: 100))
//
//let centerRect = Rect(center: Point(x: 50, y: 50),
//                        size: Size(width: 100, height: 100))
//
//println("basicRect:\(basicRect.toString())");
//println("originRect:\(originRect.toString())");
//println("centerRect:\(centerRect.toString())");

class Food {
    var name: String?
    init(name:String){
        self.name = name;
    }
    convenience init(){
        self.init(name:"[Unnamed]")
    }
    
    func toString() -> String{
        return "name:\(name!.lowercaseString)";
    }
    
}

class RecipeIngredient: Food {
    var quantity: Int = 0
    init(name: String,quantity:Int){
        self.quantity = quantity;
        super.init(name: name);
        
    }
    convenience init(name: String) {
        self.init(name:name,quantity:1);
    }
    override func toString() -> String {
        return "\(super.toString()), quantity:\(quantity)."
    }
}

class ShoppingListItem:RecipeIngredient{
    var purchased = false
    override func toString() -> String {
        return "\(super.toString()),"+"purchased("+(purchased ? "✔": "✘")+")"
    }
}

struct Checkerboard{
    let boardColors:[Bool] = {
            var temporaryBoard = [Bool]();
            var isBlack = false;
            for i in 1...10{
                for j in 1...10{
                    temporaryBoard.append(isBlack);
                    isBlack = !isBlack;
                }
                isBlack = !isBlack
            }
            return temporaryBoard;
        }()
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColors[(row * 10) + column]
    }
    func toString() -> String{
        var str = "";
        for i in 0...9{
            for j in 0...9{
                if(self.squareIsBlackAtRow(i, column: j)){
                    str += "0";
                }else{
                    str += "1";
                }
                if j==9{
                    str += "\n"
                }else{
                    str += "-"
                }
            }
           
        }
        return str
    }
}

//var str = NSMutableString(format: "%d,%d,%d", 1,2,3)
//str.replaceCharactersInRange(str.rangeOfString("2"), withString: "4")
//println("\(str)");

//let board = Checkerboard()
//
//println("黑色(true)/白色(false):\(board.squareIsBlackAtRow(0,column: 0))");
//
//println("\(board.toString())")
//let namedMeat = Food(name: "Bacon")
//
//let ri = RecipeIngredient(name: "beef", quantity: 3);
//
//println("\(ri.toString())")
//
//let ri2 = RecipeIngredient(name: "duck")
//
//println("\(ri2.toString())")

//let oneMysteryItem = RecipeIngredient()
//
//println("\(oneMysteryItem.toString())")
//let oneBacon = RecipeIngredient(name: "Bacon")
//println("\(oneBacon.toString())")
//let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
//
//println("\(sixEggs.toString())")
//
//
//var beef = ShoppingListItem(name: "beef", quantity: 100);
//
//println("\(beef.toString())")
//
//var duck = ShoppingListItem(name: "duck");
//println("\(duck.toString())")


//var breakfastList = [
//    ShoppingListItem(),
//    ShoppingListItem(name: "Bacon"),
//    ShoppingListItem(name: "Eggs", quantity: 6),
//]
//
//breakfastList[0].name = "Orange juice"
//breakfastList[0].purchased = true
//for item in breakfastList {
//    println(item.toString())
//}

