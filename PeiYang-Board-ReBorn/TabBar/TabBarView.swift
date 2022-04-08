//
//  TabBarView.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/2/8.
//

import SwiftUI

struct TabBarView: View {
//    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        
        GeometryReader { GeometryProxy in
            let IconWidth = GeometryProxy.size.width/7
            let IconHeight = GeometryProxy.size.height/12
            VStack {
                Spacer()
                ZStack{
                    HStack{
                    }
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: GeometryProxy.size.width, height: GeometryProxy.size.height/10)

                    if !userData.isAdmin {
                        HStack(spacing: GeometryProxy.size.width/6.5){
                            TabBarIcon(IconName: "StarBox", tabName: "StarBox", width: IconWidth, height: IconHeight,color: .yellow, assignedPage: .StarBox)
                            
                            TabBarIcon(IconName: "AllNotis", tabName: "AllNotis", width: IconWidth, height: IconHeight,color: .yellow, assignedPage: .AllNotis)
                            
                            
    //                        ZStack{
    //                            Image("Search")
    //                                .resizable()
    //                                .aspectRatio(contentMode: .fit)
    //                                .frame(width: GeometryProxy.size.width/4, height: GeometryProxy.size.width/4)
    //                                .foregroundColor(.orange)
    //                                .shadow(radius: 10,y: 5)
    //                        }
    //                        .onTapGesture {
    //                            viewRouter.currentPage = Page.Search
    //                        }
                            
                            TabBarIcon(IconName: "NotDone", tabName: "To be Done", width: IconWidth, height: IconHeight,color: .blue, assignedPage: .NotDone)
                        }
                    }
                    else{
                        HStack(spacing: GeometryProxy.size.width/6.5) {
                            TabBarIcon(IconName: "Publish", tabName: "Publish", width: IconWidth, height: IconHeight,color: .yellow, assignedPage: .PublishView)
                        }
                        .onAppear {
                            print("tabbar",userData.isAdmin)
                        }
                    }
                }
            }
        }
        .offset(y: viewRouter.isShow ? 0 : 200)
    }
    
    func hideTabBar() -> Void{
        withAnimation {
            viewRouter.isShow = false
        }
    }
    
    func showTabBar() -> Void{
        withAnimation {
            viewRouter.isShow = true
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .environmentObject(ViewRouter())
    }
}

struct TabBarIcon: View {
    let IconName, tabName: String
    let width, height: CGFloat
    let color: Color
    @EnvironmentObject var viewRouter: ViewRouter
    let assignedPage : Page
    
    var body: some View {
        VStack(spacing: 0){
            Image(IconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(color)
            
            Text(tabName)
                .font(.system(size: 14))
        }
        .padding(.bottom,-30)
        .shadow(radius: 10,y: 5)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
            print(viewRouter.currentPage)
        }
    }
}
    
