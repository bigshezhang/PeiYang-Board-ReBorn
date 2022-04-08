//
//  StarBoxView.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/2/9.
//

import SwiftUI

struct StarBoxView: View {
    @EnvironmentObject var viewRouter: ViewRouter
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
                        MainPageHeader()
                            .onTapGesture {
                                viewRouter.isShow.toggle()
                            }
                            .padding(.top)
                        
//                        MainWeekIndicator()
//                            .padding(.top,ByHeight(Scale: -5))
//                            .padding(.bottom,ByHeight(Scale: 0.1))

                        ForEach(notis.indices,id: \.self){ i in
                            if(notis[i].stared == true){
                                MainPageNaviRow(noti: notis[i])
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
        StarBoxView()
            .environmentObject(ViewRouter())
    }
}
