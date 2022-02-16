//
//  questionImage.swift
//  Peiyang Board
//
//  Created by 刘晋闻 on 2022/2/10.
//

import SwiftUI

struct questionImage: View {
    var body: some View {
        ZStack{
            Image("SearchView-3")
            Image("SearchView-4")
                .offset(x : -14, y : 22)
        }
    }
}

struct questionImage_Previews: PreviewProvider {
    static var previews: some View {
        questionImage()
    }
}
