//
//  TabBarView.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/2/8.
//

import SwiftUI

struct TabBarView: View {
//    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        
        if viewRouter.isShow {      //如果需要展示TabBar
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
                        HStack(spacing: GeometryProxy.size.width/9){
                            TabBarIcon(IconName: "StarBox", tabName: "StarBox", width: IconWidth, height: IconHeight,color: .yellow, viewRouter: viewRouter, assignedPage: .StarBox)
                            
                            ZStack{
                                Image("Search")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: GeometryProxy.size.width/4, height: GeometryProxy.size.width/4)
                                    .foregroundColor(.orange)
                                    .shadow(radius: 10,y: 5)
                            }
                            .onTapGesture {
                                viewRouter.currentPage = Page.Search
                            }
                            TabBarIcon(IconName: "NotDone", tabName: "To be Done", width: IconWidth, height: IconHeight,color: .blue, viewRouter: viewRouter, assignedPage: .NotDone)
                        }
                    }
                }
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(viewRouter: ViewRouter())
    }
}

struct TabBarIcon: View {
    let IconName, tabName: String
    let width, height: CGFloat
    let color: Color
    @StateObject var viewRouter: ViewRouter
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
    