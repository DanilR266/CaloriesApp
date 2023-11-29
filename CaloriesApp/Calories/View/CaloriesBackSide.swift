//
//  CaloriesBackSide.swift
//  CaloriesApp
//
//  Created by Данила on 01.07.2023.
//

import SwiftUI

struct CaloriesBackSide: View {
    var size = Size()
//    var keyboardResponder: KeyboardResponder
    @State private var isSheetPresented = false
//    @Binding var isFlipped: Bool
    @State var rotate: Bool = false
    @State var amount: Int = 0
    @State var fastChange: Double = 0 {
        didSet {
            let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
            impactFeedbackgenerator.prepare()
            impactFeedbackgenerator.impactOccurred()
        }
    }
    @State var valueFast: Int = 0
    @ObservedObject var shared: CaloriesViewModel
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack(alignment: .center) {
                Text("Калории")
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.bottom, 50)
                ZStack(alignment: .top) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: size.screenWidth(), height: size.screenHeight())
                        .background(Color.field)
                        .cornerRadius(24)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    VStack(spacing: 1) {
                        VStack {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: size.scaleWidth(358), height: size.scaleHeight(149))
                                    .background(Color.white)
                                    .cornerRadius(18)
                                    .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: -2, y: -2)
                                    .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: 3, y: 4)
                                HStack(alignment: .bottom, spacing: size.scaleHeight(30)) {
                                    VStack {
                                        Text("Съедено")
                                            .font(.system(size: 24, weight: .bold))
                                            .foregroundColor(.black)
                                        ZStack {
                                            Circle()
                                                .trim(from: 0, to: 1)
                                                .stroke(Color.black, lineWidth: 3)
                                                .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                                                .foregroundColor(.fieldWeight)
                                                .rotationEffect(.degrees(-90))
                                            Text("\(shared.calories)")
                                                .font(.system(size: 28, weight: .bold))
                                                .foregroundColor(Color.buttonColor)
                                                .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                                                .multilineTextAlignment(.center)
                                        }
                                    }
                                    VStack {
                                        ZStack {
                                            Circle()
                                                .trim(from: 0, to: 1)
                                                .stroke(Color.black, lineWidth: 3)
                                                .frame(width: size.scaleWidth(50), height: size.scaleWidth(50))
                                                .foregroundColor(.fieldWeight)
                                                .rotationEffect(.degrees(-90))
                                            Text("\(Int(fastChange))")
                                                .font(.system(size: 14, weight: .bold))
                                                .foregroundColor(Color.buttonColor)
                                                .frame(width: size.scaleWidth(50), height: size.scaleWidth(50))
                                                .multilineTextAlignment(.center)
                                        }
                                    }
                                    VStack {
                                        Text("Осталось")
                                            .font(.system(size: 24, weight: .bold))
                                            .foregroundColor(.black)
                                        ZStack {
                                            Circle()
                                                .trim(from: 0, to: shared.fillCircle)
                                                .stroke(Color.fieldWeight, lineWidth: shared.lineWidth)
                                                .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                                                .foregroundColor(.fieldWeight)
                                                .rotationEffect(.degrees(-90))
                                            Text("\(shared.caloriesGoal - shared.calories)")
                                                .font(.system(size: 28, weight: .bold))
                                                .foregroundColor(Color.buttonColor)
                                                .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                                                .multilineTextAlignment(.center)
                                        }
                                    }
                                }
                            }
                            ScrollView {
                                VStack(spacing: 6) {
                                    Text("Быстрое изменение")
                                        .foregroundColor(Color.black.opacity(0.5))
                                        .font(.system(size: 32, weight: .bold))
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: size.scaleWidth(358), height: size.scaleHeight(57))
                                            .background(Color.white)
                                            .cornerRadius(18)
                                            .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: -2, y: -2)
                                            .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: 3, y: 4)
                                        Slider(value: $fastChange, in: -400...400, step: 10, onEditingChanged: { value in
                                            if value == false {
                                                withAnimation {
                                                    shared.fastCahngeCalories(fastChange: Int(fastChange))
                                                    shared.setFood(food: ["Быстрое изменение", "0", "\(Int(fastChange))"])
                                                }
                                            }
                                            withAnimation {
                                                fastChange = 0
                                            }
                                        })
                                        .frame(width: size.scaleWidth(300))
                                        .accentColor(.buttonColor)
                                    }
                                }.padding(.top, size.scaleHeight(20))
                                VStack(spacing: 20) {
                                    Rectangle()
                                        .foregroundColor(Color.field)
                                        .frame(width: size.screenWidth(), height: 1)
                                    NavigationLink {
                                        CaloriesAddView(viewModel: shared)
                                        //                                    WeightChange()
                                    } label: {
                                        ZStack() {
                                            Rectangle()
                                                .foregroundColor(.clear)
                                                .frame(width: size.scaleWidth(358), height: size.scaleHeight(57))
                                                .background(Color.white)
                                                .cornerRadius(18)
                                                .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: -2, y: -2)
                                                .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: 3, y: 4)
                                            HStack {
                                                Text("Добавить")
                                                    .font(.system(size: 24, weight: .bold))
                                                    .foregroundColor(.black)
                                                Spacer()
                                                Image(systemName: "arrow.right")
                                                    .resizable()
                                                    .foregroundColor(.black)
                                                    .frame(width: 20, height: 20)
                                            }.padding(.leading, 30).padding(.trailing, 20)
                                        }
                                    }
                                    NavigationLink {
                                        CaloriesAddYour(viewModel: shared)
                                    } label: {
                                        ZStack() {
                                            Rectangle()
                                                .foregroundColor(.clear)
                                                .frame(width: size.scaleWidth(358), height: size.scaleHeight(57))
                                                .background(Color.white)
                                                .cornerRadius(18)
                                                .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: -2, y: -2)
                                                .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: 3, y: 4)
                                            HStack {
                                                Text("Добавить свое")
                                                    .font(.system(size: 24, weight: .bold))
                                                    .foregroundColor(.black)
                                                Spacer()
                                                Image(systemName: "arrow.right")
                                                    .resizable()
                                                    .foregroundColor(.black)
                                                    .frame(width: 20, height: 20)
                                            }.padding(.leading, 30).padding(.trailing, 20)
                                        }
                                    }
                                    NavigationLink {
                                        SavedFood(viewModel: shared)
                                    } label: {
                                        ZStack() {
                                            Rectangle()
                                                .foregroundColor(.clear)
                                                .frame(width: size.scaleWidth(358), height: size.scaleHeight(57))
                                                .background(Color.white)
                                                .cornerRadius(18)
                                                .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: -2, y: -2)
                                                .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: 3, y: 4)
                                            HStack {
                                                Text("Мои блюда")
                                                    .font(.system(size: 24, weight: .bold))
                                                    .foregroundColor(.black)
                                                Spacer()
                                                Image(systemName: "arrow.right")
                                                    .resizable()
                                                    .foregroundColor(.black)
                                                    .frame(width: 20, height: 20)
                                            }.padding(.leading, 30).padding(.trailing, 20)
                                        }
                                    }
                                    Rectangle()
                                        .foregroundColor(Color.field)
                                        .frame(width: size.screenWidth(), height: 1)
                                    
                                }.padding(.top, 26)
                            }
                        }.padding(.top, 20)
                            
                    }
                }
            }.padding(.top, 250)
        }
    }
}

struct CaloriesBackSide_Previews: PreviewProvider {
    static var previews: some View {
        CaloriesBackSide(shared: CaloriesViewModel())
    }
}
// https://api.edamam.com/api/nutrition-data?app_id=ee907db6&app_key=f2f5e16b5082a818510c5edebc08db67&ingr=100 g cucumber
