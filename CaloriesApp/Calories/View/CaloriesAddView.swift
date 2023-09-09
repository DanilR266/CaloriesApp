//
//  CaloriesAddView.swift
//  CaloriesApp
//
//  Created by Данила on 06.09.2023.
//

import SwiftUI

struct TabViewCaloriesAdd: View {
    @ObservedObject var viewModel: CaloriesViewModel
    @State var selectedTab: Int = 0
    var body: some View {
        TabView(selection: $selectedTab, content: {
            CaloriesAddView(viewModel: viewModel)
                .tag(0)
            CaloriesAddYour(viewModel: viewModel)
                .tag(1)
        }).onAppear {
            viewModel.nameFood = "Блюдо"
            viewModel.ccal = "0"
            viewModel.prot = "0"
            viewModel.chocdf = "0"
            viewModel.fat = "0"
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
//        .ignoresSafeArea()
    }
}

struct CaloriesAddView: View {
    @State private var redSize: CGSize = .zero
    @State private var yellowSize: CGSize = .zero
    @ObservedObject var viewModel: CaloriesViewModel
    @State var textFood: String = ""
    @State var sizeFood: String = ""
    @State var buttonTap: Bool = false
    var size = Size()
    var body: some View {
        VStack {
            RectangleNutrients(viewModel: viewModel, height: $buttonTap, size: size)
            Text("Узнать калорийность блюда")
                .font(.system(size: 24, weight: .bold))
                .frame(width: size.scaleWidth(300))
                .multilineTextAlignment(.center)
                .padding(.top, 38)
            ZStack(alignment: .leading) {
                Image(systemName: "magnifyingglass")
                    .padding(.leading, 13)
                TextField("Например: сыр", text: $textFood)
                    .padding(.leading, 43)
                    .font(.system(size: 24, weight: .regular))
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: size.scaleWidth(339), height: size.scaleHeight(41))
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                        .inset(by: 1)
                        .stroke(.black, lineWidth: 2)
                    )
            }
            .frame(width: size.scaleWidth(339), height: size.scaleHeight(41))
            .padding(.top, 10)
            ZStack(alignment: .leading) {
                Image(systemName: "magnifyingglass")
                    .padding(.leading, 13)
                TextField("Например: 100 г", text: $sizeFood)
                    .padding(.leading, 43)
                    .font(.system(size: 24, weight: .regular))
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: size.scaleWidth(339), height: size.scaleHeight(41))
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                        .inset(by: 1)
                        .stroke(.black, lineWidth: 2)
                    )
            }
            .frame(width: size.scaleWidth(339), height: size.scaleHeight(41))
            Button {
                viewModel.getNutrients(texts: [textFood])
            } label: {
                ZStack {
                    Rectangle()
                        .frame(width: size.scaleWidth(241), height: size.scaleHeight(35))
                        .cornerRadius(7)
                        .foregroundColor(.regButton)
                        .shadow(radius: 3, y: 4)
                    Text("Рассчитать")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                }
            }.padding(.top, 25)
            Button {
                
            } label: {
                ZStack {
                    Rectangle()
                        .frame(width: size.scaleWidth(241), height: size.scaleHeight(35))
                        .cornerRadius(7)
                        .foregroundColor(.regButton)
                        .shadow(radius: 3, y: 4)
                    Text("Добавить")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                }
            }
            Spacer()
        }
    }
}

struct RectangleNutrients: View {
    @ObservedObject var viewModel: CaloriesViewModel
    @Binding var height: Bool
    var size: Size
    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: size.screenWidth(), height: size.scaleHeight(217))
                .background(Color.fieldCalories)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
            VStack {
                Text(viewModel.nameFood)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: size.screenWidth())
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                HStack(spacing: 34) {
                    ZStack {
                        Circle()
                            .strokeBorder(Color.buttonColor, lineWidth: 2)
                            .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                            .foregroundColor(.fieldWeight)
                        Text(viewModel.ccal)
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(Color.buttonColor)
                            .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                            .multilineTextAlignment(.center)
                    }
                    HStack(spacing: 16) {
                        CircleNutrients(letter: "Б", text: viewModel.prot,percent: "25", size: size)
                        CircleNutrients(letter: "Ж", text: viewModel.fat,percent: "25", size: size)
                        CircleNutrients(letter: "У", text: viewModel.chocdf,percent: "25", size: size)
                    }
                }
            }.padding(.bottom, 20)
        }
    }
}

struct CircleNutrients: View {
    var letter: String
    var text: String
    var percent: String
    var size: Size
    var body: some View {
        VStack {
            Text(letter)
                .font(.system(size: 16, weight: .bold))
            ZStack {
                Circle()
                    .strokeBorder(Color.buttonColor, lineWidth: 2)
                    .frame(width: size.scaleWidth(43), height: size.scaleWidth(43))
                    .foregroundColor(.fieldWeight)
                Text(text)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color.buttonColor)
                    .frame(width: size.scaleWidth(43), height: size.scaleWidth(43))
                    .multilineTextAlignment(.center)
            }
            ZStack {
                Circle()
                    .strokeBorder(Color.buttonColor, lineWidth: 2)
                    .frame(width: size.scaleWidth(43), height: size.scaleWidth(43))
                    .foregroundColor(.fieldWeight)
                Text(percent)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color.buttonColor)
                    .frame(width: size.scaleWidth(43), height: size.scaleWidth(43))
                    .multilineTextAlignment(.center)
            }
        }
    }
}


struct CaloriesAddView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewCaloriesAdd(viewModel: CaloriesViewModel())
    }
}
