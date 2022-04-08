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
    

//    @AppStorage("history") var historySearch: [String] = []
    static let historySearch = UserDefaults(suiteName: "history")!
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
//        historySearch = [""]
    }
    
    
}

// 解决AppStorage无法解释数组的问题
extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}


var userData = UserData()
