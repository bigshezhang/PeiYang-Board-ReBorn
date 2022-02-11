//
//  CurrentTime.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/1/10.
//
//  获取当前时间
import Foundation

struct Current_Time{
    var day = Calendar.current.component(.day, from: Date())
    var month = Calendar.current.component(.month, from: Date())
    var weekOfYear = Calendar.current.component(.weekOfYear, from: Date())
}

let time = Current_Time()
