//
//  main.swift
//  TypeCasting
//
//  Created by WangXiaoXiang on 14-7-22.
//  Copyright (c) 2014年 Next. All rights reserved.
//

import Foundation

class MediaItem{
    var name:String
    init(name:String){
        self.name = name;
    }
}

class Movie:MediaItem{
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}


class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "花瓶", director: "汪潇翔"),
    Song(name: "七里香", artist: "周杰伦"),
    Movie(name: "变形金刚4", director: "汪潇翔"),
    Song(name: "bili", artist: "潘玮柏"),
    Song(name: "打呼", artist: "潘玮柏")
]

var movieCount = 0
var songCount = 0

for item in library{
    if item is Song{
        ++songCount;
    }else if item is Movie{
        ++movieCount;
    }
}
println("电影:\(movieCount),歌曲:\(songCount)")
println("\n\n")

for item in library{
    if let movie = item as? Movie{
        println("电影:\(movie.name),导演:\(movie.director)")
    }else if let song = item as? Song{
        println("歌名:\(song.name),演唱者:\(song.artist)")
    }
}

let someObjects:[AnyObject] = [
    Song(name: "小苹果", artist: "筷子兄弟"),
    //平凡之路  朴树
    Song(name: "平凡之路", artist: "朴树"),
    //想唱就唱  TFBOYS
    Song(name: "想唱就唱", artist: "TFBOYS")
]

println("\n\n")

for object in someObjects[0...1]{
    let song = object as Song
    println("歌名:\(song.name),演唱者:\(song.artist)")
    
//    let movie = object as Movie
//    println("电影:\(movie.name),导演:\(movie.director)")
}

println("\n\nsong in someObjects as [Song]")

for song in someObjects as [Song]{
    println("歌名:\(song.name),演唱者:\(song.artist)")
}

var things = [Any]();

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "一路向西", director: "Ivan Reitman"))
things.append(Song(name: "小苹果", artist: "筷子兄弟"))


println("\n\n")
for thing in things{
    switch thing{
//    case 0 as Int:
//         println("zero as an Int")
//    case 0 as Double:
//        println("zero as an Double")
    case let someInt as Int:
        println("an integer value of \(someInt)")
    case let someDouble as Double where someDouble>0:
        println("a positive double value of \(someDouble)")
    case is Double:
        println("some other double value that I don't want to print")
    case let someString as String:
        println("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        println("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        println("a movie called '\(movie.name)', dir. \(movie.director)")
    case let song as Song:
        println("歌名:\(song.name),演唱者:\(song.artist)")
    default:
        println("其他类型")
    }
}







