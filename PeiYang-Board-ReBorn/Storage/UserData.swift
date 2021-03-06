//
//  UserData.swift
//  PeiYang-Board-ReBorn
//
//  Created by 李子鸣 on 2022/2/11.
//

import Foundation
import SwiftUI

final class UserData: ObservableObject {
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
    func clean(){
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
    
    func save() {
        UserDefaults.standard.set(isNeedLogin, forKey: "isNeedLogin")
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(password, forKey: "password")
        UserDefaults.standard.set(school, forKey: "school")
        UserDefaults.standard.set(major, forKey: "major")
        UserDefaults.standard.set(grade, forKey: "grade")
        UserDefaults.standard.set(inclass, forKey: "inclass")
        UserDefaults.standard.set(isAdmin, forKey: "isAdmin")
        UserDefaults.standard.set(checkupdate, forKey: "checkupdate")
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

