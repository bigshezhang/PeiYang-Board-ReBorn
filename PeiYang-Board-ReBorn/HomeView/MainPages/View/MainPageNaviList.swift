//
//  MainPageNaviList.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/1/17.
//


//Discarded


import SwiftUI

struct MainPageNaviList: View {
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        List(notis[1..<10]){ noti in
        NavigationLink{
            MainPageNaviRow( viewRouter: viewRouter)
        }
        label: {
            MainPageNaviRow(viewRouter: viewRouter, noti: notis[1])
            }
        }
    }
}

struct MainPageNaviList_Previews: PreviewProvider {
    static var previews: some View {
        MainPageNaviList(viewRouter: ViewRouter())
    }
}
