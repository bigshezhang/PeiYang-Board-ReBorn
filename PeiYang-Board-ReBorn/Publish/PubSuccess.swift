//
//  PubSuccess.swift
//  Peiyang Board
//
//  Created by 刘晋闻 on 2022/2/10.
//

import SwiftUI

struct PubSuccess: View {
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Image("MainDetail_Foot")
            }
            .ignoresSafeArea()
            VStack{
                Image("success")
                    .padding(.bottom)
                Text("发布成功")
                    .font(.custom(FZMS, size: 50))
                    .padding(.top, 30)
                Text("2020年2月20号20:20")
                    .font(.custom(FZMS, size: 25))
                    .padding(.top)
                
            }
            .padding(.bottom, 70)
        }
        
    }
}

struct PubSuccess_Previews: PreviewProvider {
    static var previews: some View {
        PubSuccess()
    }
}
