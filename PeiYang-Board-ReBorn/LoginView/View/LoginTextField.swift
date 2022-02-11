//
//  LoginTextField.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/1/15.
//

import SwiftUI

struct LoginTextField: View {
    @Binding var username: String
    @Binding var password: String
    var body: some View {
        VStack(alignment: .center) {
            Group{
                FormField(fieldName: "Username", fieldValue: $username, img: "Login_Person", isSecure: false)

                FormField(fieldName: "Password", fieldValue: $password, img: "Login_Lock", isSecure: true)
            }
        }

    }
}


struct FormField: View{
    var fieldName = ""
    @Binding var fieldValue: String
    var img: String
    var isSecure = false
    @State var isShowingPW = false
    var body: some View {
        if isSecure{
            VStack {
                ZStack {
                    HStack {
                        Image(img)
                        if !isShowingPW {
                            SecureField("", text: $fieldValue)
                                .placeholder(when: fieldValue.isEmpty) {
                                    Text(fieldName)
                                        .foregroundColor(Color("Blue_Login_Text"))
                                }
                                .foregroundColor(Color("Blue_Login_Text"))
                                .font(.custom(RTW, size: 32))
                                .frame(width: ByWidth(Scale: 60), alignment: .center)
                                .padding(.leading)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        } else{
                            TextField("", text: $fieldValue)
                                .placeholder(when: fieldValue.isEmpty) {
                                    Text(fieldName).foregroundColor(Color("Blue_Login_Text"))}
                                .foregroundColor(Color("Blue_Login_Text"))
                                .font(.custom(RTW, size: 32))
                                .frame(width: ByWidth(Scale: 60), alignment: .center)
                                .padding(.leading)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                            }
                        }
                    HStack{
                        Spacer()
                        Button(action: {isShowingPW.toggle()}){
                        Image(isShowingPW ? "Close_Eye" : "Open_Eye")
                            .frame(width: ByWidth(Scale: 8))
                        }
                        .padding(.trailing, ByWidth(Scale: 15))
                    }
                }

                Path{path in
                    path.move(to: CGPoint(x: ByWidth(Scale: 15), y: 0))
                    path.addLine(to: CGPoint(x: ByWidth(Scale: 90), y: 0))
                }
                .strokedPath(StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
                .fill(Color("Blue_Login_TextBorder"))
                .frame(height: 2.5)
            }
        } else{
            VStack {
                HStack {
                    Image(img)
                    TextField("", text: $fieldValue)
                        .placeholder(when: fieldValue.isEmpty) {
                            Text("Username").foregroundColor(Color("Blue_Login_Text"))}
                        .foregroundStyle(Color("Blue_Login_Text"))
                        .font(.custom(RTW, size: 32))
                        .frame(width: ByWidth(Scale: 60), alignment: .center)
                        .padding(.leading)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                
                Path{path in
                    path.move(to: CGPoint(x: ByWidth(Scale: 15), y: 0))
                    path.addLine(to: CGPoint(x: ByWidth(Scale: 90), y: 0))
                }
                .strokedPath(StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
                .fill(Color("Blue_Login_TextBorder"))
                .frame(height: 2.5)
            }
        }
    }
}

//struct LoginTextField_Previews: PreviewProvider {
//    @State var username2 = ""
//    @State var password2 = ""
//    static var previews: some View {
//        LoginTextField(username: $username2, password: $password2)
//    }
//}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
