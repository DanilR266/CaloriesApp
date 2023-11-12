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
            Text("Съедено сегодня")
                .foregroundColor(.black)
                .font(.system(size: 20, weight: .bold))
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
            viewModel.getFood()
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
