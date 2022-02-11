//
//  PeiYang_Board_ReBornApp.swift
//  PeiYang-Board-ReBorn
//
//  Created by 李子鸣 on 2022/2/11.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct PeiYang_Board_ReBornApp: App {
    let persistenceController = PersistenceController.shared

    init(){
        FirebaseApp.configure() //Firebase初始化
    }
    
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
