//
//  RegisterPage.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/1/16.
//

import SwiftUI

struct RegisterPage: View {

    @State var turnToLogin = false
    @State var register_Success = false
    @State var username = ""
    @State var password = ""
    @State var confirm_password = ""
//    @EnvironmentObject var login_Storage : Login_storage
    var body: some View {
        ZStack{
            if(!turnToLogin && !register_Success) {
                ZStack {
                    VStack{
                        HStack{
                            Spacer()
                            Image("LoginView_Head")
                                .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 210)
                                .overlay(
                                    Text("登陆")
                                        .font(.system(size: 32, weight: .bold))
                                        .foregroundColor(Color("Blue_Register_Font"))
                                        .offset(x: 37, y: 12)
                                )
                                .onTapGesture {
                                    toLogin()
                            }
                        }
                        Spacer()
                    }
                    
                    VStack {
                        Image("Login_TopPic")
                            .frame(width: 287, height: 167)
                            .padding(.bottom, 30)
                        
                        RegisterTextField(username: $username, password: $password, confirm_password: $confirm_password)
                        
                        HStack {
                            Spacer()
                            Button(action: get_Register){
                                Image("Submit_Login")
                                    .overlay(
                                        Text("提交")
                                            .font(.system(size: 30,weight: .bold))
                                            .foregroundColor(Color("Blue_Register_Font"))
                                    )
                            }
                            .padding(.trailing, ByWidth(Scale: 12))
                        }
                    }
                    .padding(.bottom, ByHeight(Scale: 10))
                    
                    VStack {
                        Spacer()
                        Image("LoginView_Foot")
                    }
                }
            } else if turnToLogin {
                LoginPage()
            } else if (!turnToLogin && register_Success){
                MainView()
            }
        }
        .ignoresSafeArea(.all)
    }
        
//        if(!turnToLogin && !register_Success) {
//            VStack{
//                HStack{
//                    Spacer()
//                    Image("LoginView_Head")
//                        .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 210)
//                        .overlay(
//                            Text("登陆")
//                                .font(.system(size: 32, weight: .bold))
//                                .foregroundColor(Color("Blue_Register_Font"))
//                                .offset(x: 37, y: 12)
//                        )
//                        .onTapGesture {
//                            toLogin()
//                        }
//                }
//                Spacer()
//                RegisterTextField(username: $username, password: $password, confirm_password: $confirm_password)
//                    .offset(y: -30)
//                HStack {
//                    Spacer()
//                    Button(action: get_Register){
//                        Image("Submit_Login")
//                            .frame(width: 98, height: 45)
//                            .overlay(
//                                Text("提交")
//                                    .font(.system(size: 30,weight: .bold))
//                                    .foregroundColor(Color("Blue_Register_Font"))
//                                    .offset(y: -3)
//                            )
//
//                    }
//                    .offset(x:-33)
//                }
//                Image("LoginView_Foot")
//
//            }
//            .ignoresSafeArea(.all)
//            .frame(height: UIScreen.main.bounds.height)
//        } else if (turnToLogin)
//        {
//            LoginPage()
//                .environmentObject(Login_storage())
//        }   else if (!turnToLogin && register_Success){
//            MainView()
//        }
//    }
    
    func toLogin() {
        withAnimation(.easeIn(duration: 0.0)){
            turnToLogin.toggle()
            }
    }
    
    func get_Register(){
//        login_Storage.username = self.username
//        login_Storage.password = self.password
        var result = true
        if result{
            withAnimation(.easeInOut(duration: 0.5)){
                register_Success = true
                userData.isNeedLogin.toggle()
            }
        }
       // print(login_Storage.username)
    }
}

struct RegisterPage_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPage()
    }
}
