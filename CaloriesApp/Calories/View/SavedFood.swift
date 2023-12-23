//
//  SavedFood.swift
//  CaloriesApp
//
//  Created by Данила on 09.11.2023.
//

import SwiftUI

struct SavedFood: View {
    var size = Size()
    @ObservedObject var viewModel: CaloriesViewModel
    var body: some View {
        ZStack {
            Color.backgroundColor.edgesIgnoringSafeArea(.top)
            VStack {
                Text("Мои блюда")
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                ZStack(alignment: .top) {
                    VStack(spacing: -size.scaleHeight(20)) {
                        Rectangle()
                            .frame(width: size.screenWidth())
                            .foregroundColor(Color.field)
                            .cornerRadius(24)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        Rectangle()
                            .frame(width: size.screenWidth())
                            .foregroundColor(Color.field)
                    }
                    VStack {
                        Button {
                            viewModel.cleanMyFood()
                            
                        } label: {
                            Text("Очистить список")
                                .frame(width: size.screenWidth(), alignment: .center)
                        }
                        ScrollView(.vertical) {
                            Rectangle()
                                .foregroundColor(Color.field)
                                .frame(width: size.screenWidth(), height: 1)
                            ForEach(viewModel.arrayMyFood, id: \.self) { item in
                                RectangleMyFood(viewModel: viewModel, name: item.name, sizeFood: item.size, kcal: item.kcal).padding(.bottom, 12)
                            }
                        }.padding(.top, 10)
                    }.padding(.top, 10).padding(.bottom, 1)
                }
            }.padding(.top, 15)
        }
        .onAppear {
            viewModel.arrayMyFood = []
            viewModel.getMyFood()
        }
    }
}





struct RectangleMyFood: View {
    @ObservedObject var viewModel: CaloriesViewModel
    var size = Size()
    var name: String
    var sizeFood: String
    var kcal: String
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: size.scaleWidth(358), height: size.scaleHeight(83))
                .background(Color.white)
                .cornerRadius(18)
                .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: -2, y: -2)
                .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: 3, y: 4)
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("\(name)")
                        .font(.system(size: 24, weight: .bold))
                        .lineLimit(1)
                    Text("\(kcal) ккал в \(sizeFood) г")
                        .font(.system(size: 18, weight: .regular))
                        .foregroundColor(.black.opacity(0.5))
                        .lineLimit(1)
                }
                Spacer()
                Button {
                    viewModel.setFood(food: [name, sizeFood, kcal])
                    viewModel.addCalories(calorie: Int(kcal) ?? 0)
                } label: {
                    ZStack {
                        Circle()
                            .foregroundColor(.black)
                            .frame(width: 38, height: 38)
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 26, height: 26)
                            .foregroundColor(Color.fieldWeight)
                    }
                }

            }.padding(.leading, 10).padding(.trailing, 20)
        }.padding(.leading, 10)
    }
}


struct SavedFood_Previews: PreviewProvider {
    static var previews: some View {
        SavedFood(viewModel: CaloriesViewModel())
    }
}
