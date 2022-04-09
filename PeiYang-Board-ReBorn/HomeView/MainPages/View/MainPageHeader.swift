//
//  MainPageHeader.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/1/16.
//

import SwiftUI

struct MainPageHeader: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var NotiStore: NotiStore
    var body: some View {
        ZStack{
            HStack {
                VStack{
                    HStack{
                        Text("\(NumberToChinese(num: time.month))月\(NumberToChinese(num: time.day))日")
                            .font(.custom(FZMS, size: ByWidth(Scale: 12)))
                            .foregroundColor(Color("Main_Header_Font"))
                        
                        Image(systemName: "sun.max")    //小太阳用了offset
                            .font(.system(size: ByWidth(Scale: 10),weight: .light))
                            .foregroundColor(Color("Sun_Weather"))
                            .offset(x:ByWidth(Scale: -10), y:ByHeight(Scale: -3))
                    }
                    .padding(.leading, ByWidth(Scale: 10))
                    
                    
                    //不知道为什么不能加Path，加上之后前面的文字不能居中
//                    Path{path in
//                        path.move(to: CGPoint(x: ByWidth(Scale: 5), y: 0))
//                        path.addLine(to: CGPoint(x: ByWidth(Scale: 60), y: 0))
//                    }
//                    .strokedPath(StrokeStyle(lineWidth: 1.5, lineCap: .round, lineJoin: .round))
//                    .fill(Color("Main_Header_Font"))
                    
                    HStack{
                        Text("总消息数")
                            .foregroundColor(Color("Main_Header_Font"))
                            
                        Text("\(NotiStore.Notis.count)")
                            .frame(width: 40)
                            .foregroundColor(Color("Main_Header_Font"))
                    }
                    .font(.custom(FZMS, size: 20))
                    .onTapGesture {
                        print(userData.isAdmin)
                        print(viewRouter.isShow)
                    }
                }
                .frame(height: ByHeight(Scale: 20))
                
                Spacer()
            }
            HStack{               //头像
                Spacer()
                NavigationLink {
                    SettingView()
                        .onAppear {
                            viewRouter.isShow = false
                        }
                } label: {
                    ZStack{
                        Text("@")
                            .font(.system(size: ByWidth(Scale: 30), weight: .light))
                            .foregroundColor(Color("Main_Header_Font"))
                        
                        Image("user")
                            .resizable()
                            .opacity(0.8)
                            .frame(width: ByWidth(Scale: 20), height: ByWidth(Scale: 20))
                            .clipShape(Circle())
                            .offset(y: ByHeight(Scale: 1))
                            .shadow(color: Color.gray, radius: 10, x: 5, y: 5)
                    }
                }
            }
            .padding(.trailing, ByWidth(Scale: 5))
            .padding(.bottom, ByHeight(Scale: 3))

        }
    }
}

struct MainPageHeader_Previews: PreviewProvider {
    static var previews: some View {
        MainPageHeader()
            .environmentObject(ViewRouter())
    }
}
