////
////  Home_components.swift
////  Peiyang Board
////
////  Created by 李子鸣 on 2022/1/13.
////
//
//import SwiftUI
//
//@ViewBuilder
//func Head_View()->some View{
//    HStack {
//        VStack{
//            ZStack{
//                Text("\(time.month)月\(time.day)日")
//                    .font(.system(size: 40))
//                    .foregroundColor(Color("Main_Font"))
//                    .position(x: 100, y: 40)
//                
//                Image(systemName: "sun.max")
//                    .rotationEffect(Angle.init(degrees: -5))
//                    .font(.system(size: 30))
//                    .position(x: 178, y: 15)
//                    
//            }
//            Path{path in
//                path.move(to: CGPoint(x: 35, y: 25))
//                path.addLine(to: CGPoint(x: 163, y: 25))
//                
//            }
//            .strokedPath(StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
//            .fill(Color("Main_Font"))
//            
//            HStack{
//                Text("总消息数")
//                    .font(.system(size: 18))
//                    .foregroundColor(Color("Main_Font"))
//                    .position(x: 70, y: 0)
//                
//                Text("\(Notis.count)")
//                    .font(.system(size: 20))
//                    .foregroundColor(Color("Main_Font"))
//                    .position(x: 55, y: 0)
//            }
//        }
//        HStack{
//            ZStack{
//                Text("@")
//                    .font(.system(size: 100))
//                    .foregroundColor(Color("Main_Font"))
//                    .position(x: 120, y: 44)
//                
//                Image("user")
//                    .resizable()
//                    .frame(width: 60, height: 60)
//                    .clipShape(Circle())
//                    .position(x: 123, y: 50)
//                    .shadow(color: Color.gray, radius: 10, x: 5, y: 5)
//                
//                ZStack{
//                    Circle()
//                        .frame(width: 30, height: 30)
//                        .foregroundColor(Color("Red_Dot"))
//                        .shadow(color: Color.gray, radius: 5, x: 3, y: 3)
//                    Text("\(notis.count)")
//                        .foregroundColor(Color("Red_Dot_Font"))
//                }
//                .position(x: 150, y: 20)
//            }
//        }
//    }
//}
//
////@ViewBuilder
////func Footer_View() -> some View{
////    TabView {
////
////        Main_Page()
////             .symbolRenderingMode(.hierarchical)
////             .foregroundColor(.blue)
////         .tabItem {
////            Image(systemName: "checkmark.circle")
////                 .symbolRenderingMode(.hierarchical)
////                 .foregroundColor(.blue)
////            Text("已完成")
////          }
////        Image(systemName: "figure.walk")
////         .tabItem {
////            Image(systemName: "figure.walk")
////            Text("未完成")
////          }
////    }
////}
//
