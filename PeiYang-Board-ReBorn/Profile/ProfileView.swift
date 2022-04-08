//
//  ProfileView.swift
//  PeiYang-Board-ReBorn
//
//  Created by 李子鸣 on 2022/2/16.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userData: UserData
    @State private var nickname = ""
    @State private var school = ""
    @State private var major = ""
    @State private var grade = ""
    @State private var inclass = ""
    @State private var isAdmin = false

    var body: some View {
        VStack {
            HStack{
                Button {
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
            .frame(height: 31)
            
            ZStack{
                VStack{
                    Spacer()
                    Image("ProfileViewFooter")
                }
                .edgesIgnoringSafeArea(.all)
                
                VStack{
                    ZStack{
                        Image("ProfileViewCard")
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
                    
                    textfieldOfProfileView(title: "昵称", value: $nickname, placeholder: userData.nickname)
                    textfieldOfProfileView(title: "学院", value: $school, placeholder: userData.school)
                    textfieldOfProfileView(title: "专业", value: $major, placeholder: userData.major)
                    textfieldOfProfileView(title: "年级", value: $grade, placeholder: userData.grade)
                    textfieldOfProfileView(title: "班级", value: $inclass, placeholder: userData.inclass)
                    
                    HStack(spacing: 46){
                        Capsule()
                            .onTapGesture {
                                isAdmin.toggle()
                            }
                            .foregroundColor(!isAdmin ? Color("ProfileViewRoleSelected") : Color("ProfileViewRoleUnselected"))
                            .frame(width: 121, height: 42)
                            .overlay(
                                Text("用户")
                                    .font(.custom(FZMS, size: 20))
                            )
                        Capsule()
                            .onTapGesture {
                                isAdmin.toggle()
                            }
                            .foregroundColor(isAdmin ? Color("ProfileViewRoleSelected") : Color("ProfileViewRoleUnselected"))
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
                        self.presentationMode.wrappedValue.dismiss()

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
                .padding(.bottom, 50)
            }
            .navigationBarHidden(true)
        }
    }
    
    
    func submit() -> Void{
        userData.nickname = nickname
        userData.school = school
        userData.grade = grade
        userData.inclass = inclass
        userData.major = major
        userData.isAdmin = isAdmin
        self.presentationMode.wrappedValue.dismiss()
    }
    
}

@ViewBuilder func textfieldOfProfileView (title: String, value: Binding<String>, placeholder: String) -> some View{
    
    HStack{
        Text(title)
            .font(.custom(FZMS, size: 21))
            .foregroundColor(Color("Blue_ProfileOnReg"))
            .offset(y: 2)
        
        TextField(placeholder, text: value)
            .frame(width: 230)
            .overlay(Rectangle().frame(width: nil, height: 1).foregroundColor(Color.gray), alignment: .bottom)
            
            
        
    }
    .background(Image("ProfileViewTextfield"))
    .frame(width:322,height: 54)

    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

