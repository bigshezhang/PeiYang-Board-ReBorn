//
//  NotisStorage.swift
//  PeiYang-Board-ReBorn
//
//  Created by 李子鸣 on 2022/2/11.
//

import Foundation
import SwiftUI

struct Noti: Identifiable, Codable, Equatable{
    var checked = false
    var stared = false
    var id: UUID
    var title: String
    var main_text: String  //正文
    var publisher: String
    var publish_time: String
    var tags: [String]
//    var img: Image
    
    init(){
        id = UUID()
        title = "\(id)今天不上班"
        main_text = "好累啊，早点睡觉吧，明天早点起床去图书馆继续卷，卷4⃣️你们"
        publisher = "我"
        tags = ["摸鱼","放假","打电动"]
//        img = Image("user")
        publish_time = "12:00"
        checked = false
        stared = false
        
//        title = "今天上班去"
//        main_text = "昨天休息够了，今天上班去"
//        tags = ["上班","不休息了","卷四你们"]
//        publisher = "Looper"
//        img = Image("Looper")
//        publish_time = "00:00"
//        id = 1
    }
    
    init(id: UUID, title: String, main_text: String,tags: [String], publisher: String, publish_time: String){
        self.id = UUID()
        self.title = title
        self.main_text = main_text
        self.tags = tags
        self.publisher = publisher
        self.publish_time = publish_time
    }
}

final class NotiStore: ObservableObject {
    @Published var Notis: [Noti] = []{   //消息数组
        didSet{
            if let data = try? JSONEncoder().encode(Notis){
                UserDefaults.standard.set(data, forKey: "Notis")
            }
        }
    }
    
    init(){
        Notis.append(Noti())
        
        if let data = UserDefaults.standard.data(forKey: "Notis"){
            if let Notis = try?JSONDecoder().decode([Noti].self, from: data){
                self.Notis = Notis
            }
        }
    }
}

var notis = [Noti](repeating: Noti(), count: 7)
