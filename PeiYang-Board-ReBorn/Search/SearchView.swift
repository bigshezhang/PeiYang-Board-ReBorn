//
//  SearchView.swift
//  Peiyang Board
//
//  Created by 刘晋闻 on 2022/2/9.
//

import SwiftUI

struct SearchView: View {
    @State private var stringOfText : String = ""//搜索的问题
    @State private var historySearch = ["#摆烂", "swiftUI好难呀", "我想摆烂了", "我不做了", "我心向大世界"]//用来存储搜索记录
    @State private var question : String = ""//搜索记录的链接
    var body: some View {
        ZStack{
            Image("SearchView-1")
                .offset(y:-270)
            Image("SearchView-2")
                .offset(y:-270)
            VStack{
                ZStack{
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 326, height: 70)
                        .cornerRadius(35)
                    HStack{
                        ZStack{
                            questionImage()
                        }.offset(x:35 , y:-10)
                        
                        TextField("", text: $stringOfText)
                            .font(Font.system(size: 30))
                            .background(Color.white)
                            .foregroundColor(Color.clear)
//                            .cornerRadius(5)
                            .overlay(Text(stringOfText), alignment: .leading)
        //                    .padding()
                            .padding(EdgeInsets(top: 2, leading: 35, bottom: 0, trailing: 21))
//                            .shadow(radius: 10)
                            .frame(width: 300, height: 70)
                            
                    }
                }
                HStack{
                    Text("搜索记录")
                        .font(.custom(FZMS, size: 20))
                        .foregroundColor(.black)
                        .padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 0))
                    Spacer()
                }
    
                ZStack{
                    VStack(spacing: 20){
                        ForEach(historySearch, id: \.self) { h in
                            Button(action: {
                                question = h
                            }, label: {
                                HStack{
                                    Text(h)
                                        .font(.custom(FZMS, size: 20))
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            })
                        }
                        
                    }
                }
                    .padding(.leading, 50)
                    .padding(.top, 5)
                
                
                    Button(action: {
                        historySearch = []
                    }){
                        Text("删除")
                            .font(.custom(FZMS, size: 20))
                    }
                    .padding(.top, 10)
                VStack(spacing: 15){
                    Button(action:{
                        print("Hello, world!")
                    }){
                        ZStack{
                            HStack{
                                Text("#疫情防控")
                                    .font(.custom(FZMS, size: 25))
                                    .padding(EdgeInsets(top: 10, leading: 9, bottom: 10, trailing: 10))
                                    .background(Color.yellow)
                                    .cornerRadius(30)
                                Spacer()
                            }.padding(.leading, 20)
                        }
                        
                    }
                    HStack{
                        Button(action:{
                            print("Hello, world!")
                        }){
                            ZStack{
                                HStack{
                                    Text("#疫情防控")
                                        .font(.custom(FZMS, size: 20))
                                        .padding(EdgeInsets(top: 5, leading: 7, bottom: 5, trailing: 9))
                                        .background(Color.yellow)
                                        .cornerRadius(30)
                                    Spacer()
                                }.padding(.leading, 20)
                            }
                            
                        }
                        Button(action:{
                            print("Hello, world!")
                        }){
                            ZStack{
                                HStack{
                                    Text("#疫情防控")
                                        .font(.custom(FZMS, size: 20))
                                        .padding(EdgeInsets(top: 5, leading: 7, bottom: 5, trailing: 9))
                                        .background(Color.yellow)
                                        .cornerRadius(30)
                                    Spacer()
                                }.padding(.leading, 20)
                            }
                            
                        }
                        
                    }
                }
                Spacer()
            }
            
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
