////
////  MainWeedIndicator2.swift
////  Peiyang Board
////
////  Created by 李子鸣 on 2022/2/9.
////
//
//import SwiftUI
//
//struct MainWeekIndicator: View {
//    @State var selectedWeek = time.weekOfYear
//    var body: some View {
//        
//        HStack {
//            Picker("selectedWeek",selection: $selectedWeek){
//                ForEach(1..<52){ week in
//                    WeekIndicatorCircle(showedWeek: week)
//                }
//            }
//            .frame(width: ByWidth(Scale: 100), height: ByHeight(Scale: 100))
//            .pickerStyle(WheelPickerStyle())
//            .rotationEffect(.degrees(90))
//        }
//        .frame(width: ByWidth(Scale: 100), height: ByHeight(Scale: 15))
//        
//    }
//}
//
//class selectedWeek: ObservableObject{
//    @Published var SelectedWeek = time.weekOfYear
//}
//            
//struct WeekIndicatorCircle: View{
//    var showedWeek: Int
//    @State var radius = ByWidth(Scale: 20)
//    @State var positionX : CGFloat = 192
//    var color = Color("Primary")
//    var body: some View{
//        GeometryReader{ GeometryProxy in
//            Circle()
//
//                .foregroundColor(color)
//                .overlay(
//                    VStack{
//                        Text("第")
//                        HStack{
//                            Text("\(NumberToChinese(num:showedWeek))")
//                        }
//                        Text("周")
//                    }
//                )
//        }
//        .frame(width: radius, height: radius)
//    }
//}
//
//struct MainWeedIndicator2_Previews: PreviewProvider {
//    static var previews: some View {
//        MainWeekIndicator()
//    }
//}
