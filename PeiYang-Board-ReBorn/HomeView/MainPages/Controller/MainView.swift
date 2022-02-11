//
//  BaseView.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/1/14.
//

import SwiftUI

struct MainView: View {

    @StateObject var viewRouter = ViewRouter()
    
    
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
                DoneView(viewRouter: viewRouter)
            case .Done:
                DoneView(viewRouter: viewRouter)
            }
            TabBarView(viewRouter: viewRouter)
                .animation(Animation.default,value: viewRouter.isShow)
                .offset(y: viewRouter.isShow ? 0 : ByHeight(Scale: 15))
        }
      //  .edgesIgnoringSafeArea(.all)
    }
}

//@ViewBuilder
//func Footer_View() -> some View{
//    TabView {
//        NotDoneView()
//         .tabItem {
//            Image(systemName: "checkmark.circle")
//                 .symbolRenderingMode(.hierarchical)
//                 .foregroundColor(.blue)
//            Text("已完成")
//          }
//        Image(systemName: "figure.walk")
//         .tabItem {
//            Image(systemName: "figure.walk")
//            Text("未完成")
//          }
//    }
//}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
