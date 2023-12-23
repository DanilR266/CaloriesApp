//
//  ProgressWeight.swift
//  CaloriesApp
//
//  Created by Данила on 30.07.2023.
//

import SwiftUI
import Charts

struct ProgressWeight: View {
    @ObservedObject var shared = ProgressWeightViewModel()
    var size = Size()
    var body: some View {
        ScrollView(.vertical) {
            ScrollView(.horizontal) {
                HStack {
                    Rectangle()
                        .frame(width: 1, height: size.scaleHeight(110))
                        .foregroundColor(.white)
                    ForEach(Array(shared.arrayWeight), id: \.0) { item in
                        RectangleWeight(weight: item.value, weightPrev: "", date: item.key, size: size)
                    }
                    Rectangle()
                        .frame(width: 1, height: size.scaleHeight(110))
                        .foregroundColor(.white)
                }
                    .padding()
            }.frame(height: size.scaleHeight(100))
            VStack {
                
            }
        }
        Spacer()
        .onAppear { shared.getStoredData() }
    }
}


struct RectangleWeight: View {
    var weight: String
    var weightPrev: String
    var date: String
    var size: Size
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: size.scaleWidth(160), height: size.scaleHeight(86))
                .background(Color.white)
                .cornerRadius(18)
                .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: -2, y: -2)
                .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: 3, y: 4)
            HStack(spacing: size.scaleHeight(5)) {
                VStack(alignment: .leading) {
                    Text("\(weight) кг")
                        .font(.system(size: 20, weight: .bold))
                    Text(date)
                        .foregroundColor(.black.opacity(0.5))
                }
            }.padding(.leading, size.scaleWidth(20)).padding(.trailing, size.scaleWidth(15))
        }
    }
}

//struct ProgressWeight_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressWeight()
//    }
//}
struct LineChartView: View {
    var data: [Double]

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                for (index, value) in data.enumerated() {
                    let x = geometry.size.width / CGFloat(data.count - 1) * CGFloat(index)
                    let y = (1 - CGFloat(value)) * geometry.size.height
                    if index == 0 {
                        path.move(to: CGPoint(x: x, y: y))
                    } else {
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                }
            }
            .stroke(Color.blue, lineWidth: 2)
        }
    }
}
