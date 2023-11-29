//
//  CaloriesAddYour.swift
//  CaloriesApp
//
//  Created by Данила on 07.09.2023.
//



import SwiftUI

struct CaloriesAddYour: View {
    @ObservedObject var viewModel: CaloriesViewModel
    @State var textFood: String = ""
    @State var sizeFood: String = "100"
    @State var ccalFood: String = ""
    @State var bFood: String = ""
    @State var zFood: String = ""
    @State var uFood: String = ""
    @State var buttonTap: Bool = false
    var size = Size()
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                Text(textFood)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .padding(.bottom, 40)
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: size.screenWidth(), height: size.screenHeight())
                        .background(Color.field)
                        .cornerRadius(24)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    VStack {
                        RectangleNutrients(viewModel: viewModel, nameFood: textFood, ccalFood: ccalFood, size: size)
                        ZStack(alignment: .leading) {

                            TextField("Например: сыр", text: $textFood)
                                .padding(.leading, 13)
                                .font(.system(size: 24, weight: .regular))
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
                            TextField("Например: 300 ккал", text: $ccalFood)
                                .padding(.leading, 13)
                                .font(.system(size: 24, weight: .regular))
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
                        ZStack(alignment: .leading) {
                            TextField("По умолчанию: 100г", text: $sizeFood)
                                .padding(.leading, 13)
                                .font(.system(size: 24, weight: .regular))
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
                        HStack {
                            ZStack(alignment: .center) {
                                TextField("Б", text: $bFood)
                                    .frame(width: size.scaleWidth(87), height: size.scaleHeight(41))
                                    .font(.system(size: 24, weight: .regular))
                                    .multilineTextAlignment(.center)
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: size.scaleWidth(87), height: size.scaleHeight(41))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                        .inset(by: 1)
                                        .stroke(.black, lineWidth: 2)
                                    )
                            }
                            .frame(width: size.scaleWidth(87), height: size.scaleHeight(41))
                            Spacer()
                            ZStack(alignment: .center) {
                                TextField("Ж", text: $zFood)
                                    .frame(width: size.scaleWidth(87), height: size.scaleHeight(41))
                                    .font(.system(size: 24, weight: .regular))
                                    .multilineTextAlignment(.center)
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: size.scaleWidth(87), height: size.scaleHeight(41))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                        .inset(by: 1)
                                        .stroke(.black, lineWidth: 2)
                                    )
                            }
                            .frame(width: size.scaleWidth(87), height: size.scaleHeight(41))
                            Spacer()
                            ZStack(alignment: .center) {
                                TextField("У", text: $uFood)
                                    .font(.system(size: 24, weight: .regular))
                                    .frame(width: size.scaleWidth(87), height: size.scaleHeight(41))
                                    .multilineTextAlignment(.center)

                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: size.scaleWidth(87), height: size.scaleHeight(41))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                        .inset(by: 1)
                                        .stroke(.black, lineWidth: 2)
                                    )
                            }
                            .frame(width: size.scaleWidth(87), height: size.scaleHeight(41))
                        }.padding(.leading, 18).padding(.trailing, 18)
                        VStack(spacing: 17) {
                            Button {
                                let sizeTo100 = (Double(sizeFood) ?? 0)/100
                                let ccalSize = String(Int((Double(ccalFood) ?? 0) * sizeTo100))
                                viewModel.setFood(food: [textFood, sizeFood, ccalSize])
                                viewModel.addCalories(calorie: Int((Double(ccalFood) ?? 0) * sizeTo100))
//                                viewModel.testDate()
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
                                if textFood != "Блюдо" {
                                    let sizeTo100 = (Double(sizeFood) ?? 0)/100
                                    let ccalSize = String(Int((Double(ccalFood) ?? 0) * sizeTo100))
                                    viewModel.setMyFood(food: [textFood, sizeFood, ccalSize])
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
                            
                        }.padding(.top, 25)
                        Spacer()
                    }
                }
            }.padding(.top, 300)
        }.ignoresSafeArea()
    }
}

struct CaloriesAddYour_Previews: PreviewProvider {
    static var previews: some View {
        CaloriesAddYour(viewModel: CaloriesViewModel())
    }
}



