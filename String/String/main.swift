//
//  main.swift
//  String
//
//  Created by WangXiaoXiang on 14-7-18.
//  Copyright (c) 2014年 Next. All rights reserved.
//

import Foundation

//println("Hello, World! 1-2-3")
var str1 = "Hello, World! 1-2-3/wxx.txt"

println("1.\(str1)")

var str2 = str1.lastPathComponent

println("2.\(str2)")

var str3 = str1.localizedCompare("Hello, World! 1-2-3/wxx")

println("3.\(str3.toRaw())")

println("4.\(str1.nulTerminatedUTF8)")

var str5 =  str1.pathComponents


println("5.\(str5)\n5.1.\(str1.pathExtension)")

//var str6:String.Index = str1.substringWithRange(Range(start: 0, end: 1))
str1.substringWithRange(Range<String.Index>(start: 0, end: 1))