//
//  Login&RegisterView.swift
//  PeiYang-Board-ReBorn
//
//  Created by 李子鸣 on 2022/2/11.
//

import SwiftUI
import FirebaseAuth
import AuthenticationServices

struct LoginAndRegisterView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmpassword: String = ""
    @State private var signswitch: String = "已注册？"
    @State private var showAlertToggle = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showProfileView = false
    
    enum Signpage {
        case login
        case register
    }
    @State private var signpage = Signpage.register
    
    
    var body: some View {
        ZStack{
            VStack{     //Header和Footer
                HStack{
                    Spacer()
                    Image("LoginView_Head")
                        .overlay(
                                Text(signswitch)
                                    .font(.system(size: 25, weight: .bold))
                                    .foregroundColor(Color("Blue_Register_Font"))
                                    .offset(x: 45, y: 12)
                        )
                        .onTapGesture {
                            if(signpage == .register){
                                signpage = .login
                                signswitch = "未注册？"
                            } else {
                                signpage = .register
                                signswitch = "已注册？"
                            }
                        }
                }
                Spacer()
                Image("LoginView_Foot")
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                Image("Login_TopPic")
                    .padding(.top,100)
                    .padding(.bottom, -20)
                VStack(){
                    HStack(){
                        Image("Login_Person")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                            .padding(.trailing,10)
                        TextField("", text: $email)
                            .frame(height:40)
                            .foregroundColor(Color("Blue_Login_Text"))
                            .font(.custom(RTW, size: 32))
                            .placeholder(when: email.isEmpty) {
                                Text("Your Email")
                                    .font(.custom(RTW, size: 32))
                                    .foregroundColor(Color("Blue_Login_Text"))}
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .textContentType(.emailAddress)
//                            .foregroundColor(Color("Blue_Register_Font"))
                    }
                    .frame(height: 52)
                    .padding(.horizontal, 60)
                    
                    Path{path in
                        path.move(to: CGPoint(x: 50, y: 0))
                        path.addLine(to: CGPoint(x: 360, y: 0))
                    }
                    .strokedPath(StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
                    .fill(Color("Blue_Login_TextBorder"))
                    .frame(height: 3)
                    .padding(.top, -8)
                    
                    HStack{
                        Image("Login_Lock")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                            .padding(.trailing,10)
                        SecureField("", text: $password)
                            .foregroundColor(Color("Blue_Login_Text"))
                            .font(.custom(RTW, size: 32))
                            .placeholder(when: password.isEmpty) {
                                Text("Password")
                                    .font(.custom(RTW, size: 32))
                                    .foregroundColor(Color("Blue_Login_Text"))}
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .textContentType(.emailAddress)
                            .foregroundColor(Color("Blue_Register_Font"))
                    }
                    .frame(height: 52)
                    .padding(.horizontal, 60)
                    
                    Path{path in
                        path.move(to: CGPoint(x: 50, y: 0))
                        path.addLine(to: CGPoint(x: 360, y: 0))
                    }
                    .strokedPath(StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
                    .fill(Color("Blue_Login_TextBorder"))
                    .frame(height: 3)
                    .padding(.top, -8)
                    
                    if(signpage == .register) {     //如果是注册，则多出一个输入行
                        Group {
                            HStack{
                                Image("Login_Lock")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 32, height: 32)
                                    .padding(.trailing,10)
                                SecureField("", text: $confirmpassword)
                                    .foregroundColor(Color("Blue_Login_Text"))
                                    .font(.custom(RTW, size: 32))
                                    .placeholder(when: confirmpassword.isEmpty) {
                                        Text("ConfirmPassword")
                                            .font(.custom(RTW, size: 32))
                                            .foregroundColor(Color("Blue_Login_Text"))}
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                                    .textContentType(.emailAddress)
                                    .foregroundColor(Color("Blue_Register_Font"))
                            }
                            .frame(height: 52)
                        .padding(.horizontal, 60)
                            
                            Path{path in
                                path.move(to: CGPoint(x: 50, y: 0))
                                path.addLine(to: CGPoint(x: 360, y: 0))
                            }
                            .strokedPath(StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
                            .fill(Color("Blue_Login_TextBorder"))
                            .frame(height: 3)
                            .offset(y: -8)
                        }
                    }
                    
                    if(signpage == .login){     //如果是登陆界面，多出一个 找回密码
                        HStack{
                            Spacer()
                            Button(action: {
                                print("forget password")
                            }, label: {
                                Text("forget your password")
                                    .foregroundColor(Color("Blue_Login_Text"))
                                    .font(.custom(RTW, size: 17))
                            })
                        }
                        .padding(.trailing, 50)
                        .padding(.top, -10)
                    }
                }
                .padding(.top, 50)
                
                HStack{
                    Spacer()
                    Button(action: {
                        submit()
                    }, label: {
                        Image("Submit_Login")
                            .overlay(
                                Text("提交")
                                    .font(.system(size: 30,weight: .bold))
                                    .foregroundColor(Color("Blue_Register_Font"))
                                    .offset(y: -2)  //字样Y轴居中
                            )
                    })

                }
                .padding(.trailing, 40)

                Spacer()
            }
            .onAppear(){
                Auth.auth().addStateDidChangeListener{
                    auth, user in
                    if user != nil {
                        showProfileView = true
                    }
                }
            }
            .fullScreenCover(isPresented: $showProfileView) {
                ProfileOnRegister()
            }
            .animation(Animation.spring(),value: signpage)
        }
    }
    
    func submit() {
        if(signpage == .register && password == confirmpassword){
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                guard error == nil else {
                    alertTitle = "Uh-Oh!"
                    alertMessage = error!.localizedDescription
                    showAlertToggle.toggle()
                    return
                }
            }
        } else if(signpage == .register && password != confirmpassword){
            print("两次密码不同！！")
        }

    }
}

struct LoginAndRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        LoginAndRegisterView()
    }
}
