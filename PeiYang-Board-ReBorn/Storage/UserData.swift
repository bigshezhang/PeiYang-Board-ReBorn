//
//  UserData.swift
//  PeiYang-Board-ReBorn
//
//  Created by 李子鸣 on 2022/2/11.
//

import Foundation
import SwiftUI

struct UserData {
    @AppStorage("isNeedLogin") var isNeedLogin: Bool = true
    @AppStorage("email") var email: String = "007"
    @AppStorage("password") var password: String = "1234"
    @AppStorage("nickname") var nickname: String = "游客"

    @AppStorage("school") var school: String = "精仪学院"
    @AppStorage("major") var major: String = "工科试验班"
    @AppStorage("grade") var grade: String = "2021级"
    @AppStorage("inclass") var inclass: String = "十班"

    @AppStorage("isAdmin") var isAdmin:Bool = false

    @AppStorage("checkupdate") var checkupdate = true
    

    
    
    func UserAccountClean(){
        isNeedLogin = true
        email = "007"
        password = "1234"
        nickname = "游客"
        school = "精仪学院"
        major = "工科试验班"
        grade = "2021级"
        inclass = "十班"
        isAdmin = false
        checkupdate = true
    }
}

var userData = UserData()
