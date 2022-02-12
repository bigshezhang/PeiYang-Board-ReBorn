//
//  NewMainPageHeader.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/1/17.
//

import SwiftUI

struct NewMainPageHeader: View {
    var body: some View {
        HStack {
            VStack{
                HStack{
                    Text("\(NumberToChinese(num: time.month))月\(NumberToChinese(num: time.day))日")
                        .font(.custom(FZMS, size: 35))
                        .foregroundColor(Color("Main_Header_Font"))
                    Image(systemName: "sun.max")
                        .font(.system(size: 40,weight: .light))
                        .foregroundColor(Color("Sun_Weather"))
                        .offset(x:-26,y:-25)
                        .frame(width: 40, height: 40)
                }
                .offset(x:25,y: 20)
                Path{path in
                    path.move(to: CGPoint(x: 35, y: 0))
                    path.addLine(to: CGPoint(x: 215, y: 0))
                }
                .strokedPath(StrokeStyle(lineWidth: 1.5, lineCap: .round, lineJoin: .round))
                .fill(Color("Main_Header_Font"))
                
                HStack{
                    Text("总消息数")
                        .foregroundColor(Color("Main_Header_Font"))
//                        .position(x: 70, y: 0)
                        .offset(x:-48)
                    Text("\(Information.count)")
                        .frame(width: 40)
                        .foregroundColor(Color("Main_Header_Font"))
//                        .position(x: 55, y: 0)
                        .offset(x: 20)
                }
                .offset(x:25,y: -14)
                .font(.custom(FZMS, size: 20))
            }
            .frame(width: 245)
            ZStack{
                Text("@")
                    .font(.system(size: 135, weight: .light))
//                    .font(.system(size: <#CGFloat#>, weight: .bold))
                    .foregroundColor(Color("Main_Header_Font"))

                
                Image("user")
                    .resizable()
                    .opacity(0.8)
                    .frame(width: 85 , height: 85)
                    .clipShape(Circle())
                    .shadow(color: Color.gray, radius: 10, x: 5, y: 5)
                    .offset(x:3,y:8)
                
                ZStack{
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color("Red_Dot"))
                        .shadow(color: Color.gray, radius: 5, x: 3, y: 3)
                    Text("\(Information.count)")
                        .foregroundColor(Color("Red_Dot_Font"))
                }
                .offset(x:35,y:-30)

            }
            .frame(width: 140)
            .offset(x:-10,y:-8)
        }
        .frame(height: 120)
    }
}

struct NewMainPageHeader_Previews: PreviewProvider {
    static var previews: some View {
        NewMainPageHeader()
    }
}
