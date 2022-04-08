//
//  NotDoneView.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/1/10.
//

import SwiftUI

struct NotDoneView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var NotiStore: NotiStore
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
                        
                        MainWeekIndicator()
                            .padding(.top,ByHeight(Scale: -5))
                            .padding(.bottom,ByHeight(Scale: 0.1))

                        ForEach(NotiStore.Notis.indices,id: \.self){ i in
                            if(NotiStore.Notis[i].checked == false){
                                MainPageNaviRow(number: i)
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

struct NotDoneView_Previews: PreviewProvider {
    static var previews: some View {
        NotDoneView()
            .environmentObject(ViewRouter())
    }
}
