//
//  ViewRouter.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/2/8.
//

import SwiftUI
class ViewRouter: ObservableObject {
    @EnvironmentObject var userData: UserData
//    @AppStorage("isNeedLogin") var isNeedLogin = true
//    @Published var currentPage: Page = userData.isNeedLogin ? .Register : .AllNotis
    @Published var isShow: Bool = true
    @Published var currentPage: Page = .AllNotis
    
    func start() -> Void{
        currentPage = userData.isNeedLogin ? .Login : .AllNotis
    }
}

enum Page{
    case AllNotis
    case Done
    case NotDone
    case StarBox
    case Search
    case Login
    case Register
    case PublishView
}

//struct ViewRouter_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewRouter()
//    }
//}
