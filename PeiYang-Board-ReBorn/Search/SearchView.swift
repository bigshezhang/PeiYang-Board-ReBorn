//
//  SearchView.swift
//  Peiyang Board
//
//  Created by 刘晋闻 on 2022/2/9.
//

import SwiftUI

struct SearchView: View {
    @AppStorage("HISTORY", store: UserData.historySearch) var historySearch : [String] = []
    @State private var question : String = ""//搜索记录的链接
    @State private var stringOfText : String = ""//输入的文本
    @State private var isSearching: Bool = false
    @EnvironmentObject var Notiss: NotiStore
    @Environment(\.presentationMode) var presentationModess
    var searchResult: [Noti] {
        return Notiss.Notis.filter{
            $0.main_text.contains(stringOfText)
        }
    }
    var body: some View {
        NavigationView(){
            ZStack{
                VStack{
                    ZStack{
                        Image("SearchView-1")
                        Image("SearchView-2")
                    }
                    Spacer()
                }
                
                VStack{
                    SearchTopView(historySearch: $historySearch, stringOfText: $stringOfText, isSearching: $isSearching)
                        .padding(.top,70)
                    if !isSearching{
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
                                            .background(Color.init(red: 255, green: 235, blue: 197))
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
                                                .background(Color.init(red: 255, green: 235, blue: 197))
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
                                                .background(Color.init(red: 255, green: 235, blue: 197))
                                                .cornerRadius(30)
                                            Spacer()
                                        }.padding(.leading, 20)
                                    }
                                    
                                }
                                
                            }
                        }
                        Button("返回"){
                            self.presentationModess.wrappedValue.dismiss()
                        }
                        Spacer()
                    }else {
                    VStack(spacing: 20){
                        ForEach(searchResult.indices, id: \.self) { h in
                            NavigationLink {
                                MainPageDetail(number: h+1)
                            } label: {
                                MainPageNaviRow(number: h+1)
                            }

                        }
                        Spacer()
                            
                    }
                }
            }
        }
            .ignoresSafeArea(.all)
            .navigationBarHidden(true)
        }

       
}


fileprivate struct SearchTopView: View{
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Binding var historySearch: [String]
    @Binding var stringOfText : String //输入的搜索文本
    @Binding var isSearching: Bool //正在搜索
    var body: some View{
        ZStack{
            Rectangle()
                .fill(Color.white)
                .frame(width: 360, height: 50)
                .cornerRadius(35)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .rotationEffect(.degrees(75))
                            .padding(.leading, 20)
                            .foregroundColor(Color.blue.opacity(0.4))
                        
                        TextField("", text: $stringOfText, onCommit: {
                            isSearching.toggle()
                        })
                            .font(Font.system(size: 20))
                            .background(Color.white)
                            .foregroundColor(Color.gray)
                            .frame(width: 300, height: 70)
//                        Spacer()
                    }
                )
            
            
            
            
//            Rectangle()
//                .fill(Color.white)
//                .frame(width: 326, height: 70)
//                .cornerRadius(35)
//            HStack{
//                ZStack{
//                    questionImage()
//                }.offset(x:35 , y:-10)
                
                
                    
//            }
        }
    }

    private func searchQuestion(stringOfText: String) {

//        if !historySearch.contains(stringOfText) && !stringOfText.isEmpty {
//            historySearch.insert(stringOfText, at: 0)
//            if historySearch.count > 6 {
//                historySearch.removeLast()
//            }
//        }
        isSearching = true
        
    }
}
}

extension Color {
    init(red: Int, green: Int, blue: Int) {

        let normalizedRed = CGFloat(red) / 255
        let normalizedGreen = CGFloat(green) / 255
        let normalizedBlue = CGFloat(blue) / 255

        self.init(red: normalizedRed, green: normalizedGreen, blue: normalizedBlue)
    }
}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
