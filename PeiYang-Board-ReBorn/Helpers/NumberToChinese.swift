//
//  NumberToChinese.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/1/17.
//
//  将数字转化为汉字
import Foundation

func NumberToChinese (num: Int) -> String{
    
    let numberFormatter = NumberFormatter()
    numberFormatter.locale = Locale(identifier: "zh_CN")
    numberFormatter.numberStyle = NumberFormatter.Style.spellOut
    return(numberFormatter.string(from: NSNumber(value: num)) ?? "")
}

