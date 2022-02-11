//
//  UserData.swift
//  PeiYang-Board-ReBorn
//
//  Created by 李子鸣 on 2022/2/11.
//

import Foundation
import SwiftUI

struct UserData{
    @AppStorage("isNeedLogin") var isNeedLogin: Bool = true
    @AppStorage("username") var userName: String = "007"
    @AppStorage("password") var password: String = "1234"
    @AppStorage("nickname") var nickname: String = "游客"
}

var userData = UserData()
