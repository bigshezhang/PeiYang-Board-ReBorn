//
//  MainPageNaviList.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/1/17.
//


//Discarded


import SwiftUI

struct MainPageNaviList: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        List(notis[1..<10]){ noti in
        NavigationLink{
            MainPageNaviRow()
        }
        label: {
            MainPageNaviRow(noti: notis[1])
            }
        }
    }
}

struct MainPageNaviList_Previews: PreviewProvider {
    static var previews: some View {
        MainPageNaviList()
            .environmentObject(ViewRouter())
    }
}
