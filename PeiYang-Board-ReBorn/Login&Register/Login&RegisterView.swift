//
//  Login&RegisterView.swift
//  PeiYang-Board-ReBorn
//
//  Created by 李子鸣 on 2022/2/11.
//

import SwiftUI
import FirebaseAuth
import AuthenticationServices
import CoreMedia

struct LoginAndRegisterView: View {
    @StateObject var viewRouter: ViewRouter
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmpassword: String = ""
    @State private var signswitch: String = "已注册？"


    @State private var showProfileView = false
    @State private var isSubmitted = false
    
    @State private var showAlertToggle = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
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
                        if(signpage == .register){      //点击后再开始验证监听
                            Auth.auth().addStateDidChangeListener { (auth, user) in
                                if user != nil {
                                    showProfileView = true
                                    print(user!)
                                    print(auth)
                                    print("ShowProFile")
                                }
                            }

                        }

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
//            .onAppear() {
//            }
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
//                    print(error!.localizedDescription)
                    return
                }
                userAccountStore()
//                print("User is signed up")
            }
            
        } else if(signpage == .register && password != confirmpassword){
            alertTitle = "Uh-Oh"
            alertMessage = "两次密码不同！"
            showAlertToggle.toggle()
        } else if(signpage == .login) {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                guard error == nil else{
                    alertTitle = "Uh-Oh!"
                    alertMessage = error!.localizedDescription
                    showAlertToggle.toggle()
                    return
                }
                userAccountStore()
//                print("User is signed in")
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
    
    func userAccountStore(){       //持久化用户邮箱和密码，其他的在 userDataStore
        userData.isNeedLogin = false
        userData.email = self.email
        userData.password = self.password //没什么卵用还是存一下
    }
    
}

struct LoginAndRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        LoginAndRegisterView(viewRouter: ViewRouter())
    }
}
