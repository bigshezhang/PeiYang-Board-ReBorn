//
//  MainPageDetail.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/1/18.
//

import SwiftUI

struct MainPageDetail: View {
//    @State var noti = Noti()
    var number: Int
    @State var isToCheck = false
    @State var isToUnStar = false
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var NotiStore: NotiStore
    
//    init(){
//        checked = NotiStore.Notis[number].checked
//        stared = NotiStore.Notis[number].stared
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
                            viewRouter.isShow = true
                            if(isToCheck) {
                                NotiStore.Notis[number].checked = true
                            }
                            if(isToUnStar) {
                                NotiStore.Notis[number].stared = false
                            }
                            presentationMode.wrappedValue.dismiss()

                        }
                    //返回按钮不应该放在这里
                    ScrollView(.horizontal,showsIndicators: false) { //Tags
                        HStack{
                            ForEach(NotiStore.Notis[number].tags.indices, id: \.self){ i in
                                Text("#\(NotiStore.Notis[number].tags[i])")
                                    .font(.custom(FZMS, size: ByWidth(Scale: 8)))
                                    .foregroundColor(Color("Main_Tag_Font"))
                            }
                        }
                    }
                    //Spacer()
                }
                .frame(width: ByWidth(Scale: 95),alignment: .leading)
                .padding(.top,ByHeight(Scale: 0.6))
//                .padding(.leading,ByWidth(Scale: 8))
                
                ScrollView(.vertical,showsIndicators: false){
                    Image("user")
                        .resizable()
                        .scaledToFill()
                        .frame(width: ByWidth(Scale: 85), height: ByHeight(Scale: 25), alignment: .center)
                        .clipped()
                        .cornerRadius(ByWidth(Scale:5))
                        
                    HStack{
                        Spacer()
                        
                        Text("\(NotiStore.Notis[number].publish_time)")
                            .font(.custom(FZMS, size: ByWidth(Scale: 6)))
                    }
                    .frame(width: ByWidth(Scale: 85))
                    
    //                ScrollView(.vertical,showsIndicators: false) {
    //
    //                }
                    
                    Text("        \(NotiStore.Notis[number].main_text)")
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
                        if(NotiStore.Notis[number].checked){
                            NotiStore.Notis[number].checked.toggle()
                        } else {
                            isToCheck = true
                        }
                    }){
                        Image(systemName: "checkmark.circle")
                            .scaleEffect(3)
                            .foregroundColor((NotiStore.Notis[number].checked||isToCheck) ? Color.orange : Color.white)
                    }
                    Spacer()
                    Button(action: {
//                        stared.toggle()
                        if(!NotiStore.Notis[number].stared){
                            NotiStore.Notis[number].stared.toggle()
                        } else {
                            isToUnStar = true
                        }
                    }){
                        Image(systemName: "star")
                            .scaleEffect(2.8)
                            .foregroundColor((!NotiStore.Notis[number].stared||isToUnStar) ? Color.white : Color.yellow)
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
        MainPageDetail(number: 0)
            .environmentObject(ViewRouter())
            .environmentObject(NotiStore())
    }
}
