//
//  ProfileView.swift
//  PeiYang-Board-ReBorn
//
//  Created by 李子鸣 on 2022/2/16.
//

import SwiftUI
import FirebaseAuth

struct SettingView: View {
    @StateObject var viewRouter: ViewRouter
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isAdmin = userData.isAdmin
    @State private var strRole: String = "007"
    @State private var strIsCheckUpdate = "开"
    
    @State private var showAlertToggle = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    
    var body: some View {
        ZStack{
            Image("ProfileBackground")
                .resizable()
                .ignoresSafeArea(.all)
            
            VStack{
                HStack{
                    Button {
                        viewRouter.isShow = true
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 17, height: 31)
                            .foregroundColor(Color("SettingViewBackChevron"))
                            .padding()
                    }
                    Spacer()
                }
                
                HStack{
                    VStack(alignment: .leading){
                        HStack(spacing: 0){
                            Text("当前状态：")
                                .font(.custom(FZMS, size: 30))
                                .onAppear {
                                    strRole = isAdmin ? "管理员" : "用户"
                                }
                            Text(strRole)
                                .font(.custom(FZMS, size: 30))
                                .foregroundColor(Color("SettingViewRole"))
                        }

                        HStack(spacing: 20){
                            Text("点击")
                                .font(.custom(FZMS, size: 30))
                            Button {
                                userData.isAdmin.toggle()
                                isAdmin.toggle()
                                strRole = isAdmin ? "管理员" : "用户"
                            } label: {
                                Capsule()
                                    .frame(width: 148, height: 58)
                                    .foregroundColor(Color("SettingChangeRole"))
                                    .overlay(
                                        Text("切换状态")
                                            .font(.custom(FZMS, size: 30))
                                            .foregroundColor(.white)
                                            .offset(y: 3)
                                    )
                                    .offset(y: -1)
                            }
                        }
                    }
                    .padding(.leading,30)
                    
                    Spacer()
                    
                    Image("user")
                        .resizable()
                        .opacity(0.8)
                        .clipShape(Circle())
                        .frame(width: 82 , height: 82)
                        .shadow(color: Color.gray, radius: 3, x: 5, y: 5)
                        .padding(.trailing, 15)
                        .offset(y:-10)
                }
                
                VStack(spacing : 15){
                    NavigationLink {
                        ProfileView()
                    } label: {
                        Capsule()
                            .frame(width: 380, height: 50)
                            .foregroundColor(.white)
                            .overlay(HStack{
                                Text("个人信息")
                                    .font(.custom(FZMS, size: 20))
                                    .foregroundColor(.black)
                                    .padding(.leading,30)
                                Spacer()
                            })
                    }

                    Button {
                        userData.checkupdate.toggle()
                        strIsCheckUpdate = userData.checkupdate ? "开" : "关"
                    } label: {
                        Capsule()
                            .frame(width: 380, height: 50)
                            .foregroundColor(.white)
                            .overlay(HStack{
                                Text("检查更新")
                                    .font(.custom(FZMS, size: 20))
                                    .foregroundColor(.black)
                                    .padding(.leading,30)
                                Spacer()
                                
                                Text(strIsCheckUpdate)
                                    .padding(.trailing,50)
                                    .font(.custom(FZMS, size: 20))
                                    .foregroundColor(Color("SettingViewRole"))
                            })
                    }

                    Button {
                        userData.UserAccountClean()
                        signOut()
                        self.presentationMode.wrappedValue.dismiss()

                    } label: {
                        Capsule()
                            .overlay(Text("登出")
                                        .offset(y:2)
                                        .font(.custom(FZMS, size: 30))
                                        .foregroundColor(Color("Blue_ProfileViewSubmit")))
                            .foregroundStyle(.ultraThinMaterial)
                    }
                    .alert(isPresented: $showAlertToggle) {
                        Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
                    }
                    .frame(width: 126, height: 60)
                    .padding(.top, 35)

                }
                
                Spacer()
            }
        }
        .navigationBarHidden(true)

    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            viewRouter.currentPage = .Register
            presentationMode.wrappedValue.dismiss()
        } catch let error {
            alertTitle = "Could not log out"
            alertMessage = error.localizedDescription
            showAlertToggle.toggle()
        }
    }
    
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(viewRouter: ViewRouter())
    }
}
