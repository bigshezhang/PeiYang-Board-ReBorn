//
//  ProfileOnRegister.swift
//  PeiYang-Board-ReBorn
//
//  Created by 李子鸣 on 2022/2/12.
//

import SwiftUI

struct ProfileOnRegister: View {
    @StateObject var viewRouter: ViewRouter
    
    @State private var nickname = ""
    @State private var school = ""
    @State private var major = ""
    @State private var grade = ""
    @State private var inclass = ""
    @State private var isAdmin = false

    @Binding var showProfileView: Bool
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Image("ProfileOnRegisterFooter")
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                ZStack{
                    Image("ProfileOnRegisterCard")
                    VStack{
                        HStack{
                            VStack(alignment: .leading, spacing: -5){
                                Text("welcome")
                                    .font(.custom(FZMS, size: 42))
                                    .foregroundColor(.white)
                                
                                Text("to")
                                    .font(.custom(FZMS, size: 42))
                                    .foregroundColor(.white)
                            }
                            .padding(.leading,25)
                            Spacer()
                            Image("DefaultGravatar")
                                .padding(.trailing)
                        }
                        .offset(y: 10)
                        .padding(.top,15)
                        
                        HStack{
                            Text("Peiyang Bulletin Board")
                                .font(.custom(FZMS, size: 20))
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                        .padding(.leading, 28)
                        .padding(.bottom,55)
                    }
                }
                .frame(width: 312, height: 182)
                
                textfieldOfProfileOnRegister(title: "昵称", value: $nickname, placeholder: "例：等灯等登")
                textfieldOfProfileOnRegister(title: "学院", value: $school, placeholder: "例：电气自动化与信息学院")
                textfieldOfProfileOnRegister(title: "专业", value: $major, placeholder: "例：工科试验班")
                textfieldOfProfileOnRegister(title: "年级", value: $grade, placeholder: "例：2021级")
                textfieldOfProfileOnRegister(title: "班级", value: $inclass, placeholder: "例：十班")
                
                HStack(spacing: 46){
                    Capsule()
                        .onTapGesture {
                            isAdmin.toggle()
                        }
                        .foregroundColor(!isAdmin ? Color("ProfileOnRegisterRoleSelected") : Color("ProfileOnRegisterRoleUnselected"))
                        .frame(width: 121, height: 42)
                        .overlay(
                            Text("用户")
                                .font(.custom(FZMS, size: 20))
                        )
                    Capsule()
                        .onTapGesture {
                            isAdmin.toggle()
                        }
                        .foregroundColor(isAdmin ? Color("ProfileOnRegisterRoleSelected") : Color("ProfileOnRegisterRoleUnselected"))
                        .frame(width: 121, height: 42)
                        .overlay(
                            Text("管理员")
                                .font(.custom(FZMS, size: 20))
                        )
                }
                .animation(Animation.spring(), value: isAdmin)
                .padding(.top, 30)
                
                Button {
                    submit()
                    showProfileView = false
                    viewRouter.currentPage = .AllNotis
                } label: {
                    Capsule()
                        .overlay(Text("提交")
                                    .offset(y:2)
                                    .font(.custom(FZMS, size: 30))
                                    .foregroundColor(Color("Blue_ProfileOnRegisterSubmit")))
                        .foregroundStyle(.ultraThinMaterial)
                }
                .frame(width: 126, height: 60)
                .padding(.top, 35)

            }
            .padding(.bottom, 50)
        }
    }
    
    func submit() -> Void{
        userData.nickname = nickname
        userData.school = school
        userData.grade = grade
        userData.inclass = inclass
        userData.major = major
        userData.isAdmin = isAdmin
    }
    
}

@ViewBuilder func textfieldOfProfileOnRegister (title: String, value: Binding<String>, placeholder: String) -> some View{
    
    HStack{
        Text(title)
            .font(.custom(FZMS, size: 21))
            .foregroundColor(Color("Blue_ProfileOnReg"))
            .offset(y: 2)
        
        TextField(placeholder, text: value)
            .frame(width: 230)
            .overlay(Rectangle().frame(width: nil, height: 1).foregroundColor(Color.gray), alignment: .bottom)
            
            
        
    }
    .background(Image("ProfileOnRegisterTextfield"))
    .frame(width:322,height: 54)

    
}

struct ProfileOnRegister_Previews: PreviewProvider {
    static var previews: some View {
        ProfileOnRegister(viewRouter: ViewRouter(), showProfileView: .constant(true))
    }
}
