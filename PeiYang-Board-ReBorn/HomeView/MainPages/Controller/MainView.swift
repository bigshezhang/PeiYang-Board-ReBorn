//
//  BaseView.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/1/14.
//

import SwiftUI

struct MainView: View {

    @EnvironmentObject var viewRouter : ViewRouter
    @EnvironmentObject var NotiStore : NotiStore
    
    var body: some View {
        ZStack{
            switch viewRouter.currentPage {
            case .AllNotis:
                AllNotisView()
//                PublishView()
            case .NotDone:
                NotDoneView()
            case .StarBox:
                StarBoxView()
//                NotiAdd()
            case .Search:
//                SearchView()
//                AllNotisView()
//                NotiAdd()
                PublishView()
            case .Done:
                DoneView()
            case .Login:
                LoginAndRegisterView()
            case .Register:
                LoginAndRegisterView()
            case .PublishView:
                PublishView()
            }
            TabBarView()
                .animation(Animation.default,value: viewRouter.isShow)
                .offset(y: viewRouter.isShow ? 0 : ByHeight(Scale: 15))
        }
        .animation(Animation.easeInOut, value: viewRouter.currentPage)
      //  .edgesIgnoringSafeArea(.all)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewRouter())
    }
}
