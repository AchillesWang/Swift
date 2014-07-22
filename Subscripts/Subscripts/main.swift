//
//  main.swift
//  Subscripts
//
//  Created by WangXiaoXiang on 14-7-17.
//  Copyright (c) 2014年 Next. All rights reserved.
//

import Foundation
struct TimesTable {
    let multiplier: Int
    subscript(index:Int) -> Int{
        return multiplier * index
    }
}

//
//let threeTimesTable = TimesTable(multiplier: 3)
//
//println("3 * 100 = \(threeTimesTable[100])")
struct Matrix {
    let rows:Int,columns:Int
    var grid:[Double]
    init(rows:Int,columns:Int){
        self.rows = rows;
        self.columns = columns;
        grid = Array(count:rows * columns,repeatedValue: 0.0);
    }
    
    func indexIsValidForRow(row:Int,column:Int) -> Bool{
        return row >= 0 && row<rows && column >= 0 && column < columns
    }
    subscript(row:Int,column:Int) ->Double{
        get{
            assert(indexIsValidForRow(row, column: column), "下标错误");
            return grid[(row*column)+column]
        }
        set{
            assert(indexIsValidForRow(row, column: column), "下标错误")
            grid[(row * columns) + column] = newValue
        }
    }
}
var matrix = Matrix(rows: 2, columns: 2)

println("grid:\(matrix.grid)")
matrix[1,1] = 1.1
println("grid:\(matrix.grid)")

