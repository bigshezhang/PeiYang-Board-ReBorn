//
//  ActPerformance.swift
//  Peiyang Board
//
//  Created by 刘晋闻 on 2022/2/10.
//

import SwiftUI

struct ActPerformance: View {
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Image("MainDetail_Foot")
            }
            .ignoresSafeArea()
            VStack{
                Image("图表")
                    .offset(y : -30)
                
                
                
                
                Text("完成情况  101%")
                    .font(.custom(FZMS, size: 50))
                HStack(spacing: 100){
                    Text("未完成")
                        .font(.custom(FZMS, size: 30))
                    Image("箭头")
                    
                }
                HStack(spacing: 100){
                    Text("已完成")
                        .font(.custom(FZMS, size: 30))
                    Image("箭头")
                    
                }
            }
            
        }
    }
}

struct ActPerformance_Previews: PreviewProvider {
    static var previews: some View {
        ActPerformance()
    }
}
