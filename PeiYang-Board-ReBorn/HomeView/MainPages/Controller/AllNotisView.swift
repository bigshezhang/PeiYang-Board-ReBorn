//
//  AllNotisView.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/2/10.
//

import SwiftUI

struct AllNotisView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var NotiStore : NotiStore
    @State var isPresented = false
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

                            .padding(.top)
                        
                        MainWeekIndicator()
                            .padding(.top,ByHeight(Scale: -5))
                            .padding(.bottom,ByHeight(Scale: 0.1))
                        Button {
                            SearchView()
                        } label: {
                            ZStack{
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(width: 326, height: 70)
                                    .cornerRadius(35)
                                HStack{
                                    ZStack{
                                        questionImage()
                                    }.offset(x:35 , y:-10)
                                    
                                    Text("")
                                        .frame(width: 300, height: 70)
                                        
                                }
                            }
                        }
                        .fullScreenCover(isPresented: $isPresented) {
                            print("搜索")
                        } content: {
                            SearchView()
                        }
                      
                        ForEach(NotiStore.Notis.indices, id: \.self){ i in
                            MainPageNaviRow(number: i)
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
        AllNotisView()
            .environmentObject(ViewRouter())
            .environmentObject(NotiStore())
    }
}
