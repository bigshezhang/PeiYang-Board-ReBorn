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
    @State var isSearching = false
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
                            isSearching.toggle()
                        } label: {
                            ZStack{
                                Rectangle()
                                    .fill(Color("SettingViewBackChevron").opacity(0.5))
                                    .frame(width: 360, height: 50)
                                    .cornerRadius(35)
                                    .overlay(
                                        HStack{
                                            Image(systemName: "magnifyingglass")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .rotationEffect(.degrees(75))
                                                .padding(.leading, 20)
                                                .foregroundColor(Color.blue.opacity(0.4))

                                            Spacer()
                                        }
                                    )
                            }
                        }
                        .fullScreenCover(isPresented: $isSearching) {
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
