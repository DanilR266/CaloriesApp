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
    @ObservedObject private var keyboardResponder = KeyboardResponder()
    @State private var redSize: CGSize = .zero
    @State private var yellowSize: CGSize = .zero
    @ObservedObject var viewModel: CaloriesViewModel
    @State var textFood: String = ""
    @State var sizeFood: String = "100"
    @State var fieldWeightActive = false
    @State var fieldFoodActive = false
//    @State var buttonTap: Bool = false
    var size = Size()
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea(edges: .top)
            VStack {
                Text("\(viewModel.nameFood)")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: size.screenWidth(), height: size.screenHeight())
                        .background(Color.field)
                        .cornerRadius(24)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    VStack {
                        if !(fieldFoodActive || fieldWeightActive) {
                            RectangleNutrients(viewModel: viewModel, size: size)
                        }
                        ZStack(alignment: .leading) {
                            Image(systemName: "magnifyingglass")
                                .padding(.leading, 13)
                            TextField("Например: сыр", text: $textFood)
                                .padding(.leading, 43)
                                .font(.system(size: 24, weight: .regular))
                                .onSubmit {
                                    withAnimation {
                                        self.fieldFoodActive = false
                                        self.fieldWeightActive = false
                                    }
                                }
                                .onTapGesture {
                                    withAnimation {
                                        self.fieldFoodActive = true
                                    }
                                }
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: size.scaleWidth(339), height: size.scaleHeight(41))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
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
                                .onSubmit {
                                    withAnimation {
                                        self.fieldFoodActive = false
                                        self.fieldWeightActive = false
                                    }
                                }
                                .onTapGesture {
                                    withAnimation {
                                        self.fieldWeightActive = true
                                    }
                                }
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: size.scaleWidth(339), height: size.scaleHeight(41))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                    .inset(by: 1)
                                    .stroke(.black, lineWidth: 2)
                                )
                        }
                        .frame(width: size.scaleWidth(339), height: size.scaleHeight(41))
                        VStack(spacing: 12) {
                            if !(fieldFoodActive || fieldWeightActive) {
                                Button {
                                    viewModel.getNutrients(texts: [textFood], size: sizeFood)
                                } label: {
                                    ZStack {
                                        Rectangle()
                                            .frame(width: size.scaleWidth(313), height: size.scaleHeight(49))
                                            .cornerRadius(25)
                                            .foregroundColor(.backgroundColor)
                                            .shadow(radius: 3, y: 4)
                                        Text("Рассчитать")
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .bold))
                                    }
                                }
                                Button {
                                    if viewModel.nameFood != "Блюдо" {
                                        viewModel.setFood(food: [viewModel.nameFood, sizeFood, viewModel.ccal])
                                        viewModel.addCalories(calorie: Int(viewModel.ccal) ?? 0)
                                    }
                                } label: {
                                    ZStack {
                                        Rectangle()
                                            .frame(width: size.scaleWidth(313), height: size.scaleHeight(49))
                                            .cornerRadius(25)
                                            .foregroundColor(.backgroundColor)
                                            .shadow(radius: 3, y: 4)
                                        Text("Добавить")
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .bold))
                                    }
                                }
                                Button {
                                    if viewModel.nameFood != "Блюдо" {
                                        viewModel.setMyFood(food: [viewModel.nameFood, sizeFood, viewModel.ccal])
                                    }
                                } label: {
                                    ZStack {
                                        Rectangle()
                                            .frame(width: size.scaleWidth(313), height: size.scaleHeight(49))
                                            .cornerRadius(25)
                                            .foregroundColor(.backgroundColor)
                                            .shadow(radius: 3, y: 4)
                                        Text("В избранное")
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .bold))
                                    }
                                }
                            }
                            else {
                                Button {
                                    keyboardResponder.hideKeyboard()
                                    withAnimation {
                                        self.fieldFoodActive = false
                                        self.fieldWeightActive = false
                                    }
                                } label: {
                                    ZStack {
                                        Rectangle()
                                            .frame(width: size.scaleWidth(313), height: size.scaleHeight(49))
                                            .cornerRadius(25)
                                            .foregroundColor(.backgroundColor)
                                            .shadow(radius: 3, y: 4)
                                        Text("ОК")
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .bold))
                                    }
                                }.padding(.top, size.scaleHeight(10))
                            }
                        }.padding(.top, size.scaleHeight(35))
                        Spacer()
                    }.padding(.top, (fieldFoodActive || fieldWeightActive) ? size.scaleHeight(50) : 0)
                }
            }.padding(.top, size.scaleHeight(250))
        }.ignoresSafeArea()
    }
}

struct RectangleNutrients: View {
    @ObservedObject var viewModel: CaloriesViewModel
    var nameFood: String?
    var sizeFood: String?
    var ccalFood: String?
    var bfood: String?
    var zfood: String?
    var ufood: String?
    var size: Size
    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: size.scaleWidth(358), height: size.scaleHeight(149))
                .background(Color.white)
                .cornerRadius(18)
                .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: -2, y: -2)
                .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: 3, y: 4)
            VStack {
                HStack(spacing: 34) {
                    ZStack {
                        Circle()
                            .strokeBorder(Color.buttonColor, lineWidth: 2)
                            .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                            .foregroundColor(.fieldWeight)
                        Text(ccalFood ?? viewModel.ccal)
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(Color.buttonColor)
                            .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                            .multilineTextAlignment(.center)
                    }
                    HStack(spacing: 16) {
                        CircleNutrients(letter: "Б", text: bfood ?? viewModel.prot, percent: "25", size: size)
                        CircleNutrients(letter: "Ж", text: zfood ?? viewModel.fat, percent: "25", size: size)
                        CircleNutrients(letter: "У", text: ufood ?? viewModel.chocdf, percent: "25", size: size)
                    }
                }
            }.padding(.bottom, 20)
        }.padding(.top, 22)
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

