//
//  DoneView.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/2/8.
//

import SwiftUI

struct DoneView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .ignoresSafeArea(.all)
    }
}

struct DoneView_Previews: PreviewProvider {
    static var previews: some View {
        DoneView()
            .environmentObject(ViewRouter())
    }
}
