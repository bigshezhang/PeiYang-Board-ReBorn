//
//  MainPageNaviRow.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/1/17.
//

import SwiftUI

struct MainPageNaviRow: View {
    @State var isActive = false
    @EnvironmentObject var viewRouter: ViewRouter
    
    var noti = Noti()
    var body: some View {
        HStack(alignment: .center){
            noti.img
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: ByWidth(Scale: 17))
            
            VStack(alignment: .leading, spacing: ByHeight(Scale: 0)){
                HStack{ //Tags
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack {
                            ForEach(noti.tags,id: \.self){ tag in
                                Text("#\(tag)")
                            }
//                            .padding(.trailing, ByWidth(Scale: -1))
                        }
                        .lineLimit(1)
                    }
                    .frame(width: ByWidth(Scale: 50))
                }
                .frame(width: ByWidth(Scale: 60),height: ByHeight(Scale: 3), alignment: .bottomLeading)
                .font(.custom(FZMS, size: ByHeight(Scale: 2.2)))
                .foregroundColor(Color("Main_Tag_Font"))
                
                HStack(alignment: .center){ //正文预览 不是title
                    Text(noti.main_text)
                        .lineLimit(2)
                        .lineSpacing(ByHeight(Scale: 0.2))
                }
                .frame(width: ByWidth(Scale: 60),height:ByHeight(Scale: 6), alignment: .topLeading)
                .font(.system(size: ByHeight(Scale: 1.9), weight: .light))
                .padding(.top,ByHeight(Scale: 0.1))
                
            }
            .frame(width: ByWidth(Scale: 50), height: ByHeight(Scale: 8), alignment: .topLeading)
            .padding(.leading, ByWidth(Scale: 0.9))
            
            Text(noti.publish_time)
//                .padding(.bottom,ByHeight(Scale: 4.7))
                .foregroundColor(Color.gray)
                .font(.custom(FZMS,size: ByWidth(Scale: 4)))
                .frame(width: ByWidth(Scale: 15),alignment: .topLeading)
                .padding(.bottom, ByHeight(Scale: 5 ))
                .padding(.trailing,ByWidth(Scale: -4))
            
            NavigationLink(
            
                destination: MainPageDetail(noti: self.noti,checked: self.noti.checked,stared: self.noti.stared),
                isActive: $isActive,
                label: {
                    EmptyView()
                })
            NavigationLink(destination: EmptyView()){
                EmptyView()
            }
        }
        .frame(width: ByWidth(Scale: 100), height: ByHeight(Scale: 8.5), alignment: .center)
        .onTapGesture {
            isActive = true
            viewRouter.isShow = false
        }
    }
}

struct MainPageNaviRow_Previews: PreviewProvider {
    static var previews: some View {
        MainPageNaviRow(noti: notis[1])
            .environmentObject(ViewRouter())
    }

}
