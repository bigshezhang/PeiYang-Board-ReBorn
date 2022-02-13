//
//  ContentView.swift
//  PieChartView
//
//  Created by 刘晋闻 on 2022/2/12.
//


import SwiftUI

enum Condition:String {
    case 已完成
    case 未完成

    var color:Color{
        switch self {
        case .已完成:
            return Color("已完成")
        case .未完成:
            return Color("未完成")
        }
    }
}
struct FinishData {
    let value:Double
    let condition : Condition
    var color:Color{
        condition.color
    }
    var name:String{
        condition.rawValue.capitalized
    }
    
}
struct DataSet {
    static let Donerate: [FinishData] = [
        .init(value: 20, condition: .已完成),
        .init(value: 15, condition: .未完成)
    ]
}

struct DataPoint1:Identifiable {
    let id = UUID()
    let label:String
    let value:Double
    let color:Color
    var percentage:Double = 0
    var startAngle:Double = 0
    var formattedPercentage:String{
        String(format: "%.2f %%", percentage * 100)
    }
}
struct DataPoints {
    var points = [DataPoint1]()
    mutating func add(value:Double, label:String, color:Color){
        points.append(DataPoint1(label: label, value: value, color: color))
        let  total = points.reduce(0.0){
            $0 + $1.value
        }
        points = points.map{
            var point = $0
            point.percentage = $0.value / total
            return point
        }
        for i in 1..<points.count {
            let previous = points[i-1]
            let angle = previous.startAngle + previous.value * 360 / total
            var current = points[i]
            current.startAngle = angle
            points[i] = current
        }
        
    }
}

//添加一个圆弧形状
struct PieSliceShape:InsettableShape {
    var percent:Double
    var startAngle:Angle
    var insetAmount:CGFloat = 0
    func inset(by amount: CGFloat) -> some InsettableShape {
        var slice = self
        slice.insetAmount += amount
        return slice
    }
    func path(in rect: CGRect) -> Path {
        Path(){path in
            path.addArc(center: CGPoint(x: rect.size.width/2, y: rect.size.width/2), radius: rect.size.width/2 - insetAmount, startAngle: startAngle, endAngle: startAngle + Angle(degrees: percent * 360), clockwise: false)
        }
    }
}

//生成圆弧视图
struct PieSlice:View {
    var percent:Double
    var degree:Double
    var color:Color
    var body: some View{
        GeometryReader{geometry in
            PieSliceShape(percent: percent, startAngle: Angle(degrees: degree))
                .strokeBorder(color,lineWidth: geometry.size.width/2)
                .rotationEffect(.degrees(-90))
                .aspectRatio(contentMode: .fit)
        }
    }
}

//界面布局视图
struct PieChart:View {
    var dataPoints:DataPoints
    var body: some View{
        VStack(spacing: 30, content: {
            Text("任务完成情况")
                .font(.custom(FZMS, size: 40))
                .foregroundColor(Color("完成情况"))
            Spacer()
            ZStack{
                ForEach(dataPoints.points) { point in
                    PieSlice(percent: point.percentage, degree: point.startAngle, color: point.color)
                }
            }.aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
            Spacer()
            ForEach(dataPoints.points) { p in
                HStack( spacing: 16, content: {
                    Text("\(p.label):\(p.formattedPercentage)")
                        .font(.custom(FZMS, size: 30))
                        .foregroundColor(p.color)
                    Spacer()
                    Spacer()
                    Image(systemName : "chevron.down")
                        .foregroundColor(p.color)
                        .font(.system(size: 40))
                    Spacer()
                })
            }
        })
       
        
    }
}

//生成数据和显示
struct PieContentView:View {
    @State var dataSet:[DataPoints] = [
        DataSet.Donerate.reduce(into: DataPoints()){data0,data1 in
            data0.add(value: data1.value, label: data1.name, color: data1.color)
        }
    ]
    @State var selctedCity = 0
    var body: some View{
        VStack( spacing: 30, content: {
            Spacer()
            PieChart(dataPoints: dataSet[selctedCity])
                .aspectRatio(1,contentMode: .fit)
            Spacer()
        }).padding(.horizontal,20)
    }
}
struct RecycleRoundView_Previews: PreviewProvider {
    static var previews: some View {
        PieContentView()
    }
}
