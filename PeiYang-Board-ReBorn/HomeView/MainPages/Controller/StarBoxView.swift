//
//  StarBoxView.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/2/9.
//

import SwiftUI

struct StarBoxView: View {
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    HStack{
                        Spacer()
                        Image("MainPage_Head")
                            .frame(width: UIScreen.main.bounds.width)
                            .offset(y:-20)
                    }
                    Spacer()
                }
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        MainPageHeader(viewRouter: viewRouter)
                            .onTapGesture {
                                viewRouter.isShow.toggle()
                            }
                            .padding(.top)
                        
//                        MainWeekIndicator()
//                            .padding(.top,ByHeight(Scale: -5))
//                            .padding(.bottom,ByHeight(Scale: 0.1))

                        ForEach(notis.indices,id: \.self){ i in
                            if(notis[i].stared == true){
                                MainPageNaviRow(viewRouter: viewRouter, noti: notis[i])
                            }
                        }

                        Spacer()
                            .padding(.bottom,ByHeight(Scale: 20))
                    }
                }
                .navigationBarHidden(true)
            }
            .ignoresSafeArea(.all)

        }
    }
}

struct StarBoxView_Previews: PreviewProvider {
    static var previews: some View {
        StarBoxView(viewRouter: ViewRouter())
    }
}
