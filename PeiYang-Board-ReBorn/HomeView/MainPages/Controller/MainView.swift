//
//  BaseView.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/1/14.
//

import SwiftUI

struct MainView: View {

    @StateObject var viewRouter : ViewRouter
    
    
    var body: some View {
        ZStack{
            switch viewRouter.currentPage {
            case .AllNotis:
                AllNotisView(viewRouter: viewRouter)
            case .NotDone:
                NotDoneView(viewRouter: viewRouter)
            case .StarBox:
                StarBoxView(viewRouter: viewRouter)
            case .Search:
                SearchView()
            case .Done:
                DoneView(viewRouter: viewRouter)
            case .Login:
                LoginAndRegisterView(viewRouter: viewRouter)
            case .Register:
                LoginAndRegisterView(viewRouter: viewRouter)
            }
            TabBarView(viewRouter: viewRouter)
                .animation(Animation.default,value: viewRouter.isShow)
                .offset(y: viewRouter.isShow ? 0 : ByHeight(Scale: 15))
        }
        .animation(Animation.easeInOut, value: viewRouter.currentPage)
      //  .edgesIgnoringSafeArea(.all)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewRouter: ViewRouter())
    }
}
