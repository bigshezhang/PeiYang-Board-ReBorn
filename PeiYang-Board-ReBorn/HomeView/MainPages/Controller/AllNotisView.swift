//
//  AllNotisView.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/2/10.
//

import SwiftUI

struct AllNotisView: View {
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
                        MainPageHeader()
                            .onTapGesture {
                                userData.UserAccountClean()
                            }
                            .padding(.top)
                        
                        MainWeekIndicator()
                            .padding(.top,ByHeight(Scale: -5))
                            .padding(.bottom,ByHeight(Scale: 0.1))

                        ForEach(notis.indices,id: \.self){ i in
                            MainPageNaviRow(viewRouter: viewRouter, noti: notis[i])
                        }
                        Spacer()
                            .padding(.bottom,ByHeight(Scale: 20))
                    }
                }
                .navigationBarHidden(true)
                
                VStack{
                    Spacer()
                    Image("MainPage_Foot")

                }
            }
            .ignoresSafeArea(.all)

        }
    }
}
struct AllNotisView_Previews: PreviewProvider {
    static var previews: some View {
        AllNotisView(viewRouter: ViewRouter())
    }
}
