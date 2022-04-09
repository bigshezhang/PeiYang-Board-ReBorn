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
    @EnvironmentObject var userData: UserData
    
    @State var title : String = ""
    @State var tags : [String] = []
    @State var mainText : String = ""
    @State var tempTag : String = ""
    
    @FocusState private var editorIsFocused: Bool
    
    var body: some View {
        
        ZStack {
            VStack{
                Spacer()
                Image("MainDetail_Foot")
            }
            .ignoresSafeArea(.all)
            
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
                            viewRouter.isShow.toggle()
                            viewRouter.currentPage = .AllNotis
                            presentationMode.wrappedValue.dismiss()
                        }

                    TextField(text: $title, label: {
                        Text("输入标题")
                    })
                    .font(.system(size: 22))
                    .overlay(Rectangle()
                        .frame(width: nil, height: 1)
                        .foregroundColor(Color.gray)
                        .padding(.top,35))
//                        .padding(.horizontal)
                        
                    
                    Capsule()
                        .foregroundColor(Color("Primary"))
                        .frame(width: 160, height: 40)
                        .overlay(
                            TextField(text: $tempTag, label: {
                                Text("输入tag")
                            })
                            .padding(.horizontal)
                        )
                        .onSubmit {
                            tags.append(tempTag)
                            tempTag = ""
                        }
                }
                    .frame(width: ByWidth(Scale: 95),alignment: .leading)
                    .padding(.top,ByHeight(Scale: 0.6))
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        ForEach(tags, id: \.self){ tag in
                            Text("#\(tag)")
                                .font(.custom(FZMS, size: 24))
                                .foregroundColor(Color("Main_Tag_Font"))
                                .background(
                                    Capsule()
                                        .foregroundColor(Color("Primary"))
                                        .padding(.horizontal, -10)
                                        .padding(.vertical, -5)
                                )
                            
                            Spacer(minLength: 25)
                            
//                            Capsule()
//                                .foregroundColor(Color("Primary"))
//                                .frame(width: CGFloat(tag.count*40), height: 35)
//                                .overlay(
//                                    Text("#\(tag)")
//                                        .font(.custom(FZMS, size: 24))
//                                        .foregroundColor(Color("Main_Tag_Font"))
//                                )
                        }
                    }
                    .padding(.leading, 40)

                }
                

                
                ScrollView(.vertical,showsIndicators: false){
                    Image("user")
                        .resizable()
                        .scaledToFill()
                        .frame(width: ByWidth(Scale: 85), height: ByHeight(Scale: 25), alignment: .center)
                        .clipped()
                        .cornerRadius(ByWidth(Scale:5))


//                    TextEditor(text: $mainText)
//                                .foregroundColor(Color.gray)
//                                .font(.custom("HelveticaNeue", size: 13))
//                                .frame(width: ScreenWidth*0.8, height:ScreenHeight*0.4)
                    
                    Rectangle()
                        .frame(width: ScreenWidth*0.85, height: ScreenHeight*0.35)
                        .foregroundColor(Color.white.opacity(0.9))
                        .blur(radius: 5)
//                        .padding(.top,ByHeight(Scale: 1.8))
//                        .padding(ByWidth(Scale: 3)) //留白 80 + 3 + 3 = 86
//                        .background(Color.white.opacity(0.9).blur(radius: 10))
                        .cornerRadius(ByWidth(Scale: 8))
//                        .offset(y: ByHeight(Scale: -1))  //迫不得已用offset
                        .padding(.top, ByHeight(Scale: 1.8))
                        .overlay(
                            TextEditor(text: $mainText)
                                .font(.system(size: 18))
                                .foregroundColor(Color.gray)
                                .padding()
                                .focused($editorIsFocused)
                                .dismissKeyboard()
                        )

                    Spacer()
                        .navigationBarHidden(true)
                    
                    Button {
                        submit()
                        viewRouter.isShow.toggle()
                        viewRouter.currentPage = .AllNotis

                    } label: {
                        Capsule()
                            .overlay(Text("提交")
                                        .offset(y:2)
                                        .font(.custom(FZMS, size: 30))
                                        .foregroundColor(Color("Blue_ProfileViewSubmit")))
                            .foregroundStyle(.ultraThinMaterial)
                    }
                    .frame(width: 126, height: 60)
                    .padding(.top, 35)
                }
            }
        }
        .onTapGesture {
            UIApplication.shared.keyWindow?.endEditing(true)

        }
        .onAppear {
            viewRouter.isShow.toggle()
        }
    }
    func submit() -> Void{
        NotiStore.Notis.append(Noti(id: UUID(), title: self.title, main_text: self.mainText, tags: self.tags, publisher: userData.nickname, publish_time: "1200"))
    }
}

struct PublishView_Previews: PreviewProvider {
    static var previews: some View {
        PublishView()
            .environmentObject(ViewRouter())
            .environmentObject(UserData())
            .environmentObject(NotiStore())
    }
}
