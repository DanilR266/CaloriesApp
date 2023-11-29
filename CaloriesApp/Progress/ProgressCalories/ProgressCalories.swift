//
//  ProgressCalories.swift
//  CaloriesApp
//
//  Created by Данила on 31.07.2023.
//

import SwiftUI

struct ProgressCalories: View {
    @ObservedObject var viewModel = ProgressViewModel()
    var size = Size()
    var body: some View {
        VStack {
            HStack(spacing: 5) {
                DatePicker("", selection: $viewModel.selectedDate, displayedComponents: [.date] )
                    .foregroundColor(.blue)
                    .frame(width: 80)
                    
//                Button {
//
//                } label: {
//                    HStack {
//                        Text("сегодня")
//                            .font(.system(size: 20, weight: .bold))
//                        Image(systemName: "calendar")
//                            .resizable()
//                            .frame(width: size.scaleWidth(15), height: size.scaleHeight(15))
//                    }
//                }
            }
            ProgressBar(start: viewModel.startccal, end: viewModel.caloriesGoal, widthSecond: viewModel.widthSecond(), size: size)
            ScrollView(.vertical) {
                Rectangle()
                    .foregroundColor(Color.white)
                    .frame(width: size.screenWidth(), height: 1)
                ForEach(viewModel.arrayFood, id: \.self) { item in
                    RectangleFood(name: item.name, sizeFood: item.size, kcal: item.kcal).padding(.bottom, 5)
                }
            }.padding(.bottom, 1)
        }
        .onAppear {
            viewModel.arrayFood = []
            viewModel.getFood(date: viewModel.selectedDate)
        }
    }
}

struct RectangleFood: View {
    var size = Size()
    var name: String
    var sizeFood: String
    var kcal: String
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: size.scaleWidth(331), height: size.scaleHeight(86))
                .background(Color.white)
                .cornerRadius(18)
                .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: -2, y: -2)
                .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: 3, y: 4)
            HStack {
                Text(name)
                    .font(.system(size: 20, weight: .medium))
                    .frame(maxWidth: size.scaleWidth(158), maxHeight: size.scaleHeight(62), alignment: .leading)
                VStack(alignment: .leading) {
                    HStack {
                        Image("weight-scale")
                            .resizable()
                            .frame(width: size.scaleWidth(15), height: size.scaleWidth(15))
                        HStack(spacing: 5) {
                            Text(sizeFood)
                                .font(.system(size: 20, weight: .medium))
                            Text("g")
                                .font(.system(size: 20, weight: .medium))
                        }
                    }
                    HStack {
                        Image("calories")
                            .resizable()
                            .frame(width: size.scaleWidth(15), height: size.scaleWidth(15))
                        HStack(spacing: 5) {
                            Text(kcal)
                                .font(.system(size: 20, weight: .medium))
                            Text("kcal")
                                .font(.system(size: 20, weight: .medium))
                        }
                    }
                }
            }.padding()
        }
    }
}



struct ProgressCalories_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCalories()
    }
}


struct ProgressBar: View {
    var start: Int
    var end: Int
    var widthSecond: Int
    var size: Size
    var body: some View {
        VStack {
            HStack {
                Text("\(start)")
                    .font(.system(size: 20, weight: .medium))
                Spacer()
                Text("\(end)")
                    .font(.system(size: 20, weight: .medium))
            }.frame(width: size.scaleWidth(340))
            ZStack(alignment: .leading) {
                Rectangle()
                    .cornerRadius(15)
                    .foregroundColor(.backgroundColor)
                    .frame(width: size.scaleWidth(340), height: size.scaleHeight(20))
                Rectangle()
                    .cornerRadius(15)
                    .foregroundColor(.fieldWeight)
                    .frame(width: size.scaleWidth(CGFloat(widthSecond)), height: size.scaleHeight(20))
            }
        }
    }
}
