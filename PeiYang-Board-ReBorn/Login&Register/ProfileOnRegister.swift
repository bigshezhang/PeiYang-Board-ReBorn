//
//  ProfileOnRegister.swift
//  PeiYang-Board-ReBorn
//
//  Created by 李子鸣 on 2022/2/12.
//

import SwiftUI

struct ProfileOnRegister: View {
    @State private var school = ""
    @State private var major = ""
    @State private var grade = ""
    @State private var inclass = ""
    
    var body: some View {
        ZStack{
            VStack{
                Image("ProfileOnRegisterCard")
                
                textfieldOfProfileOnRegister(title: "学院", value: $school, placeholder: "2333")
            }
            
            
            VStack{
                Spacer()
                Image("ProfileOnRegisterFooter")
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

@ViewBuilder func textfieldOfProfileOnRegister (title: String, value: Binding<String>, placeholder: String) -> some View{
    
    Image("ProfileOnRegisterTextfield")
        .overlay(
            TextField(placeholder, text: value)
        )
    
}

struct ProfileOnRegister_Previews: PreviewProvider {
    static var previews: some View {
        ProfileOnRegister()
    }
}
