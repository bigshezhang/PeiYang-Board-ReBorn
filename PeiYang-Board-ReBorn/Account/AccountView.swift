//
//  AccountView.swift
//  Peiyang Board
//
//  Created by 刘晋闻 on 2022/2/9.
//

import SwiftUI

struct AccountView: View {
    @State private var isShowingUpdate = false
    @State private var isWarning = false
    var body: some View {
        ZStack{
            //背景
            ZStack{
                Image("Vector-1")
                    .offset(y:100)
                Image("Vector-2")
                    .offset(y:100)
//                Image("Vector")
//                    .offset(y:305)
            }
            .ignoresSafeArea()
            VStack{
                //顶部个人信息
                HStack{
                    VStack{
                        HStack{
                        Text("当前状态：")
                            .font(.custom(FZMS, size:30))
                        Text("用户")
                            .font(.custom(FZMS, size:30))
                        }
                        HStack{
                            Text("点击")
                                .font(.custom(FZMS, size:30))
                                
                            Button(action: {print("touch")}){
                                Text("切换状态")
                                    .font(.custom(FZMS, size:30))
                                    .frame(width: 148, height: 58)
                                    .background(Color("Button"))
                                    
                            }
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(40)
                            .offset(x:8)
                        }
                        
                    }
                        
                    
                    ZStack{
                        Text("@")
                            .font(.system(size: 135, weight: .light))
                            .foregroundColor(Color("Main_Header_Font"))

                        
                        Image("user")
                            .resizable()
                            .opacity(0.8)
                            .frame(width: 85 , height: 85)
                            .clipShape(Circle())
                            .shadow(color: Color.gray, radius: 10, x: 5, y: 5)
                            .offset(x:3,y:8)
                        
                        ZStack{
                            Circle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color("Red_Dot"))
                                .shadow(color: Color.gray, radius: 5, x: 3, y: 3)
                            Text("\(Information.count)")
                                .foregroundColor(Color("Red_Dot_Font"))
                        }
                        .offset(x:35,y:-30)

                    }
                    .offset(y:-8)
                }
                Spacer()
            
                //三个白按钮
                VStack(spacing: 15) {
                    Button(action:{
                        isShowingUpdate.toggle();
                    }){
                        Text("检查更新")
                            .font(.custom(FZMS, size: 20))
                            .offset(x:-100)
                            .foregroundColor(.black)
                            .frame(width: 350, height: 50)
                    }
                    .modifier(ButtonModifier())
                    
                    
                    
                    Button(action:{
                        isWarning.toggle()
                    }){
                        HStack{
                            Text("消息提醒")
                                .font(.custom(FZMS, size: 20))
                                .foregroundColor(.black)
//                                .frame(width: 350, height: 50)
                                .offset(x:19)
                            Spacer()
                            Text(isWarning ? "开" : "关")
                                .font(.custom(FZMS, size: 20))
                                .foregroundColor(.black)
//                                .frame(width: 350, height: 50)
                            
                        }
                    }
                    .modifier(ButtonModifier())
                    
                    Button(action:{
                        print("Hello,world")
                    }){
                        Text("设置")
                            .font(.custom(FZMS, size: 20))
                            .offset(x:-120)
                            .foregroundColor(.black)
                            .frame(width: 350, height: 50)
                    }
                    .modifier(ButtonModifier())
                }
                Text("联系我们QQ:2274605804")
                    .font(.custom(FZMS, size: 10))
                    .offset(x:-100, y:25)
                
                Button(action: {print("touch")}){
                    Text("登出")
                        .font(.custom(FZMS, size:30))
                        
                        .frame(width: 126, height: 60)
                        .background(Color("Button"))
                        
                }
                .frame(width: 126, height: 60)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(40)
                .offset(y:30)
                    
                   
                Spacer()
                Image("Vector")
                    .offset(y:10)
            }
            if isShowingUpdate{
                Image("Ellipse 50")
                    .animation(.default)
                VStack{
                    Text("当前")
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Sun_Weather"))
                        .font(.custom(FZMS, size:42))
                        .offset(y:-10)
                    Text("已是最新版本")
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Sun_Weather"))
                        .font(.custom(FZMS, size:42))
                }
            }
        }
        
        
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

//Button按键格式
fileprivate struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 350, height: 50)
            .background(Color.white)
            .cornerRadius(30)
    }
}

////警告样式
//struct UpdatingView: View {
//    var body: some View {
//        ZStack{
//            Image("Ellipse 50")
//            VStack{
//                Text("当前")
//                    .fontWeight(.heavy)
//                    .foregroundColor(Color("Sun_Weather"))
//                    .font(.custom(FZMS, size:42))
//                    .offset(y:-10)
//                Text("已是最新版本")
//                    .fontWeight(.heavy)
//                    .foregroundColor(Color("Sun_Weather"))
//                    .font(.custom(FZMS, size:42))
//            }
//        }
//    }
//}


