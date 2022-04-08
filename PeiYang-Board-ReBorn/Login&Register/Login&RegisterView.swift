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
    @EnvironmentObject var viewRouter : ViewRouter
    @EnvironmentObject var userData: UserData
    
    @State private var email: String = "123456@qq.com"
    @State private var password: String = "123456"
    @State private var confirmpassword: String = "123456"
    @State private var signswitch: String = "已注册？"


    @State var showProfileView = false
    @State private var isSigned = false //是否登陆，注册成功
    
    @State private var showAlertToggle = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    enum Signpage {
        case login
        case register
    }
    @State private var signpage = Signpage.register
    
    
    var body: some View {
        if(isSigned && viewRouter.currentPage == .AllNotis){    //能跳转时
            MainView()
        } else {
            SignCard()
        }
    }
    
    
    
    @ViewBuilder func SignCard() -> some View{
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
                            if(viewRouter.currentPage == .Register){
//                                signpage = .login
                                viewRouter.currentPage = .Login
                                
                                signswitch = "未注册？"
                            } else {
//                                signpage = .register
                                viewRouter.currentPage = .Register
                                
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
                    
                    if(viewRouter.currentPage == .Register) {     //如果是注册，则多出一个输入行
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
                    
                    if(viewRouter.currentPage == .Login){     //如果是登陆界面，多出一个 找回密码
                        HStack{
                            Spacer()
                            Button(action: {
                                sendPasswordResetEmail()
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
                        print("Submittedd")
                        print(viewRouter.currentPage)
                        print(isSigned)
                    }, label: {
                        Image("Submit_Login")
                            .overlay(
                                Text("提交")
                                    .font(.system(size: 30,weight: .bold))
                                    .foregroundColor(Color("Blue_Register_Font"))
                                    .offset(y: -2)  //字样Y轴居中
                            )
                    })
                        .alert(isPresented: $showAlertToggle) {
                            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
                        }
                }
                .padding(.trailing, 40)

                Spacer()
            }
            .onAppear() {
                if(viewRouter.currentPage == .Register){      //点击后再开始验证监听
                    print("OnListening")
                    Auth.auth().addStateDidChangeListener { (auth, user) in
                        if (isSigned == true) {
                            showProfileView = true
                        }
                    }

                }
            }
            .fullScreenCover(isPresented: $showProfileView) {
                ProfileOnRegister(showProfileView: $showProfileView)
            }
            .animation(Animation.spring(),value: viewRouter.currentPage)
        }
    }
    
    
    func submit() {
        if(viewRouter.currentPage == .Register && password == confirmpassword){
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                guard error == nil else {
                    alertTitle = "Uh-Oh!"
                    alertMessage = error!.localizedDescription
                    showAlertToggle.toggle()
//                    print(error!.localizedDescription)
                    return
                }
                print("register success")
                userAccountStore()
                end_sign()
//                print("User is signed up")
            }
            
        } else if(viewRouter.currentPage == .Register && password != confirmpassword){
            alertTitle = "Uh-Oh"
            alertMessage = "两次密码不同！"
            showAlertToggle.toggle()
        } else if(viewRouter.currentPage == .Login) {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                guard error == nil else{
                    alertTitle = "Uh-Oh!"
                    alertMessage = error!.localizedDescription
                    showAlertToggle.toggle()
                    return
                }
                userAccountStore()
                end_sign()
                print("User is signed in")
            }
        }
    }
    
    func sendPasswordResetEmail(){
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            guard error == nil else {
                alertTitle = "Uh-Oh!"
                alertMessage = error!.localizedDescription
                showAlertToggle.toggle()
                return
            }
            alertTitle = "Password reset email sent"
            alertMessage = "Go and Check your Email"
        }
    }
    
    func userAccountStore(){       //持久化用户数据
        userData.isNeedLogin = false
        userData.email = self.email
        userData.password = self.password //没什么卵用还是存一下
    }
    
    func end_sign() {
        withAnimation(.easeInOut(duration: 0.7)){
            isSigned = true
            if(viewRouter.currentPage == .Login){
                viewRouter.isShow = true
                viewRouter.currentPage = .AllNotis
            }
            viewRouter.isShow = true
            print("End_sign_>")
            print(isSigned)
        }
    }
}

struct LoginAndRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        LoginAndRegisterView()
            .environmentObject(ViewRouter())
    }
}
