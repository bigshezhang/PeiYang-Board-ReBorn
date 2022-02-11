//
//  ScreenBounds.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/1/17.
//
//  返回屏幕尺寸的百分比

import Foundation
import UIKit
 


let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

func ByWidth(Scale: Double) -> Double {
    return ScreenWidth*Scale/100.0
}

func ByHeight(Scale: Double) -> Double {
    return ScreenHeight*Scale/100.0
}
