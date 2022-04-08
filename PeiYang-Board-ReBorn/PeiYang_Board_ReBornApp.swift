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
    init(){
        FirebaseApp.configure() //Firebase初始化
    }
    
    let persistenceController = PersistenceController.shared
    
    @StateObject var viewRouter = ViewRouter()
    

    
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(ViewRouter())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
