//
//  PublishView.swift
//  PeiYang-Board-ReBorn
//
//  Created by 李子鸣 on 2022/4/9.
//

import SwiftUI

struct PublishView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var NotiStore: NotiStore
    
    @State var tags : [String] = []
    @State var mainText : String = ""
    @State var tempTag : String = ""
    
    var body: some View {
        
        ZStack {
            VStack{
                Spacer()
                Image("MainDetail_Foot")
            }
            .ignoresSafeArea(.all)
            
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
                            }
                        //返回按钮不应该放在这里
                        Spacer()
                        
                        TextField(text: $tempTag) {
                            Text("233")
                        }
                            .ignoresSafeArea(.keyboard, edges: .bottom)
                        
//                        ForEach(tags, id: \.self){ tag in
//                            Text("#\(tag)")
//                                .font(.custom(FZMS, size: ByWidth(Scale: 8)))
//                                .foregroundColor(Color("Main_Tag_Font"))
//                        }
                    }
                }
                .frame(width: ByWidth(Scale: 95),alignment: .leading)
                .padding(.top,ByHeight(Scale: 0.6))
                
                ScrollView(.vertical,showsIndicators: false){
                    Image("user")
                        .resizable()
                        .scaledToFill()
                        .frame(width: ByWidth(Scale: 85), height: ByHeight(Scale: 25), alignment: .center)
                        .clipped()
                        .cornerRadius(ByWidth(Scale:5))

                    
                    TextField(text: $mainText,label: {
                        Text("233")
                    })
                        .font(.system(size: ByHeight(Scale: 2.5)))
                        .lineSpacing(ByHeight(Scale: 0.8))
                        .frame(width: ByWidth(Scale: 80), alignment: .top)
                        .padding(.top,ByHeight(Scale: 1.8))
                        .padding(ByWidth(Scale: 3)) //留白 80 + 3 + 3 = 86
                        .padding(.bottom, ByHeight(Scale: 20)) //下方留白
                        .background(Color.white.opacity(0.9).blur(radius: 10))
                        .cornerRadius(ByWidth(Scale: 5))
                        .offset(y: ByHeight(Scale: -1))  //迫不得已用offset

                    Spacer()
                        .navigationBarHidden(true)
                }
                
            }
            
        
            
        }
    }
}

struct PublishView_Previews: PreviewProvider {
    static var previews: some View {
        PublishView()
    }
}
