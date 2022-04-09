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
    @EnvironmentObject var NotiStore: NotiStore
    
    var number: Int
    
    
//    var noti = Noti()
    var body: some View {
        HStack(alignment: .center){
            Image("user")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: ByWidth(Scale: 17))
            
            VStack(alignment: .leading, spacing: ByHeight(Scale: 0)){
                HStack{ //Tags
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack {
                            ForEach(NotiStore.Notis[number].tags, id: \.self){ tag in
                                NavigationLink(destination: tagView(tag: tag)){
                                    Text("#\(tag)")
                                }
                            }
//                            .padding(.trailing, ByWidthrScale: -1))
                        }
                        .lineLimit(1)
                    }
                    .frame(width: ByWidth(Scale: 50))
                }
                .frame(width: ByWidth(Scale: 60),height: ByHeight(Scale: 3), alignment: .bottomLeading)
                .font(.custom(FZMS, size: ByHeight(Scale: 2.2)))
                .foregroundColor(Color("Main_Tag_Font"))
                
                HStack(alignment: .center){ //正文预览 不是title
                    Text(NotiStore.Notis[number].main_text)
                        .lineLimit(2)
                        .lineSpacing(ByHeight(Scale: 0.2))
                }
                .frame(width: ByWidth(Scale: 60),height:ByHeight(Scale: 6), alignment: .topLeading)
                .font(.system(size: ByHeight(Scale: 1.9), weight: .light))
                .padding(.top,ByHeight(Scale: 0.1))
                
            }
            .frame(width: ByWidth(Scale: 50), height: ByHeight(Scale: 8), alignment: .topLeading)
            .padding(.leading, ByWidth(Scale: 0.9))
            
            Text(NotiStore.Notis[number].publish_time)
//                .padding(.bottom,ByHeight(Scale: 4.7))
                .foregroundColor(Color.gray)
                .font(.custom(FZMS,size: ByWidth(Scale: 4)))
                .frame(width: ByWidth(Scale: 15),alignment: .topLeading)
                .padding(.bottom, ByHeight(Scale: 5 ))
                .padding(.trailing,ByWidth(Scale: -4))
            
            NavigationLink(
            
                destination: MainPageDetail(number: number),
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
            viewRouter.isShow.toggle()
        }
    }
    
    
}

struct tagView: View {
    @EnvironmentObject var NotiStore: NotiStore
    @State var tag: String = ""
    @Environment(\.presentationMode) var presentationMode
    var filteredNoti: [Noti]{
        return NotiStore.Notis.filter{
            $0.tags.contains(tag)
        }
    }
    var body: some View {
        HStack{
            Image(systemName: "chevron.backward")
                .resizable()
                .scaledToFit()
                .frame(width: ByWidth(Scale: 5.5))
                .clipShape(Circle())
                .foregroundColor(Color.black)
                .padding(.top,ByHeight(Scale: -0.5))
                .padding(.leading,ByWidth(Scale: 0.8))
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
            //返回按钮不应该放在这里
            Text("#\(tag)")
                .font(.custom(FZMS, size: ByWidth(Scale: 8)))
                .foregroundColor(Color("Main_Tag_Font"))
        }
        .frame(width: ByWidth(Scale: 95),alignment: .leading)
        .padding(.top,ByHeight(Scale: 0.6))
//                .padding(.leading,ByWidth(Scale: 8))
        
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                ForEach(filteredNoti.indices, id: \.self){ i in
                    NavigationLink {
                        MainPageDetail(number: i)
                    } label: {
                        MainPageNaviRow(number: i)
                    }
                }
                Spacer()
                    .padding(.bottom,ByHeight(Scale: 20))
            }
        }
        .navigationBarHidden(true)
        
        
        
    }
}


struct MainPageNaviRow_Previews: PreviewProvider {
    static var previews: some View {
        MainPageNaviRow(number: 1)
            .environmentObject(ViewRouter())
            .environmentObject(NotiStore())
    }

}
