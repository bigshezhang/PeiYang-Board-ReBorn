//
//  MainPageDetail.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/1/18.
//

import SwiftUI

struct MainPageDetail: View {
    var noti = Noti()
    
    @State var checked: Bool
    @State var stared: Bool
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewRouter: ViewRouter
    
//    init(){
//        checked = noti.checked
//        stared = noti.stared
//    }
    var body: some View {
        
        ZStack {
            VStack{
                Spacer()
                Image("MainDetail_Foot")
            }
            .ignoresSafeArea(.all)
            
//            VStack{
//
//                Spacer()
//            }
//            .ignoresSafeArea(.all)
//            .frame(width: ScreenWidth,alignment: .topLeading)
            
            VStack{
                ScrollView(.horizontal,showsIndicators: false) { //Tags
                    HStack{
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: ByWidth(Scale: 5.5))
                            .clipShape(Circle())
                            .foregroundColor(Color.black)
                            .padding(.top,ByHeight(Scale: -0.5))
                            .padding(.leading,ByWidth(Scale: 0.8))
                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                                viewRouter.isShow = true
                            }
                        //返回按钮不应该放在这里
                        Spacer()
                        ForEach(noti.tags.indices, id: \.self){ i in
                            Text("#\(noti.tags[i])")
                                .font(.custom(FZMS, size: ByWidth(Scale: 8)))
                                .foregroundColor(Color("Main_Tag_Font"))
                        }
                        //Spacer()
                    }
//                    .padding(.top,ByHeight(Scale: 1.5))
                }
                .frame(width: ByWidth(Scale: 95),alignment: .leading)
                .padding(.top,ByHeight(Scale: 0.6))
//                .padding(.leading,ByWidth(Scale: 8))
                
                ScrollView(.vertical,showsIndicators: false){
                    noti.img
                        .resizable()
                        .scaledToFill()
                        .frame(width: ByWidth(Scale: 85), height: ByHeight(Scale: 25), alignment: .center)
                        .clipped()
                        .cornerRadius(ByWidth(Scale:5))
                        
                    HStack{
                        Spacer()
                        
                        Text("\(noti.publish_time)")
                            .font(.custom(FZMS, size: ByWidth(Scale: 6)))
                    }
                    .frame(width: ByWidth(Scale: 85))
                    
    //                ScrollView(.vertical,showsIndicators: false) {
    //
    //                }
                    
                    Text("        \(noti.main_text)")
                        .font(.system(size: ByHeight(Scale: 2.5)))
                        .lineSpacing(ByHeight(Scale: 0.8))
                        .frame(width: ByWidth(Scale: 80), alignment: .top)
                        .padding(.top,ByHeight(Scale: 1.8))
                        .padding(ByWidth(Scale: 3)) //留白 80 + 3 + 3 = 86
                        .padding(.bottom, ByHeight(Scale: 20)) //下方留白
    //                    .padding(.top, ByHeight(Scale: 2.5))
    //                    .padding(.bottom, ByHeight(Scale: 6))
                        .background(Color.white.opacity(0.9).blur(radius: 10))
                        .cornerRadius(ByWidth(Scale: 5))
                        .offset(y: ByHeight(Scale: -1))  //迫不得已用offset
                    
                    
    //                Rectangle()
    //                    .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
    //                    .frame(width: ByWidth(Scale: 85), height: ByHeight(Scale: 60))
    //                    .foregroundColor(Color.white)
    //                    .cornerRadius(ByWidth(Scale: 5))
    //                    .padding(.top, ByHeight(Scale: -1))
    //                    .opacity(0.89)
    //                    .overlay(<#T##style: ShapeStyle##ShapeStyle#>)
                    
                    Spacer()
                        .navigationBarHidden(true)
                }
                
            }
            
            VStack {
                Spacer()
                HStack{
                    Button(action: {
                        checked.toggle()
                        noti.checked = checked
                    }){
                        Image(systemName: "checkmark.circle")
                            .scaleEffect(3)
                            .foregroundColor(checked ? Color.orange : Color.white)
                    }
                    Spacer()
                    Button(action: {
                        stared.toggle()
                        noti.stared = stared
                    }){
                        Image(systemName: "star")
                            .scaleEffect(2.8)
                            .foregroundColor(stared ? Color.yellow : Color.white)
                    }
                }
                .padding(.bottom,ByHeight(Scale: 5))
                .frame(width: ByWidth(Scale: 60))
            }
            
        }
    }
}

struct MainPageDetail_Previews: PreviewProvider {
    static var previews: some View {
        MainPageDetail(noti: notis[0],checked: notis[0].checked,stared: notis[0].stared, viewRouter: ViewRouter())
    }
}
