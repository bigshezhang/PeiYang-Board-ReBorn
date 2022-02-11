//
//  MainWeekIndicator.swift
//  Peiyang Board
//
//  Created by 李子鸣 on 2022/1/17.
//

import SwiftUI

struct MainWeekIndicator: View {
    @GestureState var isDragging: Bool = false
    @State var offset: CGFloat = 0
    @State var storedoffset: CGFloat = 0
    @State var maxoffset: CGFloat = 0
    @State var IndicatedWeek = 1 //当前指向的星期
    var IndicatorCircle = [WeekIndicatorCircle](repeating: WeekIndicatorCircle(), count: 100)

    init(){
        for index in 1..<53{
            IndicatorCircle[index].weekOfYear = index
        }
    }

    var body: some View {
        VStack {
            Image(systemName: "triangle")
                .rotationEffect(.degrees(180))
                .padding(.bottom,15)
//                .offset(y:ByHeight(Scale: -2.5))
            ScrollView(.horizontal,showsIndicators: false) {
                HStack{
                    ForEach(1..<53){ index in
                        IndicatorCircle[index]

                    }
                }
            }
            .frame(width: ScreenWidth, height: ByHeight(Scale:5))

            Image(systemName: "triangle")
                .padding(.top,15)
//                .offset(y:ByHeight(Scale: 2.5))
        }
    }
}

struct WeekIndicatorCircle: View{
    var weekOfYear = time.weekOfYear
    @State var radius = ByWidth(Scale: 20)
    @State var positionX : CGFloat = 192
    var color = Color("Primary")
    var body: some View{
        GeometryReader{ GeometryProxy in
            Circle()

                .foregroundColor(color)
                .overlay(
                    VStack{
                        Text("第")
                        HStack{
                            Text("\(NumberToChinese(num:weekOfYear))")
                        }
                        Text("周")
                    }
                )
//                .gesture(
//                    DragGesture()
//                        .onChanged({ value in
//                            print(value.location.x)
//                        })
//                )
//                .onTapGesture {
//                    positionX = GeometryProxy.frame(in: .global).midX
//                    radius = 193-abs(193 - positionX)
//                    //print(positionX)
//                }
        }
        .frame(width: radius, height: radius)
    }
}


struct MainWeekIndicator_Previews: PreviewProvider {
    static var previews: some View {
        MainWeekIndicator()
    }
}

enum WeekIndicatorColor {

}
