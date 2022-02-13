//
//  ViewRouter.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/2/8.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .AllNotis
    @Published var isShow: Bool = true
}

enum Page{
    case AllNotis
    case Done
    case NotDone
    case StarBox
    case Search
    case Login
    case Register
}

//struct ViewRouter_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewRouter()
//    }
//}
