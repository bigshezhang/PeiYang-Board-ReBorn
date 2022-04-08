//
//  NotiAdd.swift
//  PeiYang-Board-ReBorn
//
//  Created by 李子鸣 on 2022/4/8.
//

import SwiftUI

struct NotiAdd: View {
    @EnvironmentObject var NotiStore: NotiStore
    
    var AddedNoti = Noti()
    
    var body: some View {
        VStack{
            Button {
                NotiStore.Notis.append(AddedNoti)
            } label: {
                Text("增加")
            }
            
            Button {
                NotiStore.Notis.removeLast()
            } label: {
                Text("删除")
            }
        }
    }
}

struct NotiAdd_Previews: PreviewProvider {
    static var previews: some View {
        NotiAdd()
            .environmentObject(NotiStore())
    }
}
