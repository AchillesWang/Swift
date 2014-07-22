//
//  main.swift
//  NestedTypes
//
//  Created by WangXiaoXiang on 14-7-22.
//  Copyright (c) 2014年 Next. All rights reserved.
//

import Foundation


struct BlackjackCard{
    // 嵌套定义枚举型Suit
    enum Suit:Character{ //花色
        case Spades = "♠", Hearts = "♡", Diamonds = "♢", Clubs = "♣"
    }
    enum Rank:Int{ //等级
        case Two = 2, Three/* 3 */, Four/* 4 */, Five/* 5 */, Six/* 6 */, Seven/* 7 */, Eight/* 8 */, Nine/* 9 */, Ten/* 10 */
        case Jack, Queen, King, Ace
        struct Values{
             let first: Int, second: Int?
        }
        //values是唯一属性
        var values:Values{
            switch self {
                case .Ace:
                    return Values(first: 1, second: 11)
                case .King, .Queen, .Jack:
                    return Values(first: 10, second: nil)
                default:
                    return Values(first: self.toRaw(), second: nil)

            }
        }
    }
    //大小和花色
    let rank: Rank, suit: Suit
    func description() -> String?{
        var output = "花色 is \(suit.toRaw()),"
        output += "大小 is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
    
}

var rank = BlackjackCard.Rank.Three;

let theAceOfSpades = BlackjackCard(rank:.Two, suit: .Spades)

println("theAceOfSpades: \(theAceOfSpades.description())")

