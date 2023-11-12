//
//  WeightView.swift
//  CaloriesApp
//
//  Created by Данила on 07.06.2023.
//

import SwiftUI

public struct Weight: View {
    @StateObject var shared = WeightViewModel()
    @State var more: Bool = true
    @State var weightSelect = false
//    @State var fillCircle: Double = 0
    var size = Size()
    public var body: some View {
        ZStack {
            Color.backgroundColor.edgesIgnoringSafeArea(.top)
            VStack(alignment: .center) {
                Text("Измерения тела")
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.bottom, size.scaleHeight(50))
                ZStack(alignment: .top) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: size.screenWidth(), height: size.screenHeight())
                        .background(Color.field)
                        .cornerRadius(24)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    VStack(spacing: 1) {
                        VStack(spacing: 1) {
                            Text("Вес")
                                .font(.system(size: 32, weight: .bold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black.opacity(0.5))
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: size.scaleWidth(358), height: weightSelect ? size.scaleHeight(358) : size.scaleHeight(149))
                                    .background(Color.white)
                                    .cornerRadius(18)
                                    .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: -2, y: -2)
                                    .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: 3, y: 4)
                                if !weightSelect {
                                    DefaultWeight(shared: shared, weightSelect: $weightSelect, fillCircle: $shared.fillCircle, size: size)
                                }
                                else {
                                    SelectedWeight(shared: shared, weightSelect: $weightSelect, fillCircle: $shared.fillCircle, size: size)
                                }
                            }
                        }
                    }
                }
            }.padding(.top, size.scaleHeight(250))
        }.onAppear {
            shared.getStoredData()
        }
    }
}


struct DefaultWeight: View {
    @StateObject var shared: WeightViewModel
    @Binding var weightSelect: Bool
    @Binding var fillCircle: Double
    var size: Size
    var body: some View {
        HStack {
            VStack {
                Text("Сейчас")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black)
                ZStack {
                    Circle()
                        .strokeBorder(Color.buttonColor, lineWidth: 3)
                        .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                        .foregroundColor(.fieldWeight)
                    Text("\(shared.weightStore)")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(Color.buttonColor)
                        .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                        .multilineTextAlignment(.center)
                }
            }
            VStack {
                Text("Цель")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black)
                ZStack {
                    Circle()
                        .trim(from: 0, to: fillCircle)
                        .stroke(Color.fieldWeight, lineWidth: shared.lineWidth)
                        .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                        .foregroundColor(.fieldWeight)
                        .rotationEffect(.degrees(-90))
                    Text("\(shared.weightGoal)")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(Color.buttonColor)
                        .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                        .multilineTextAlignment(.center)
                }
            }.padding(.leading, size.scaleWidth(60))
            Button {
                withAnimation {
                    weightSelect = true
                }
            } label: {
                Image(systemName: "arrow.right")
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width: size.scaleWidth(20), height: size.scaleHeight(20))
            }.padding(.leading, size.scaleWidth(60))
        }.frame(width: size.scaleWidth(358), height: size.scaleHeight(149))
    }
}

struct SelectedWeight: View {
    @StateObject var shared: WeightViewModel
    @Binding var weightSelect: Bool
    @Binding var fillCircle: Double
    var size: Size
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text("Сейчас")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)
                    HStack(spacing: size.scaleWidth(30)) {
                        Button {
                            self.shared.weightStore = shared.buttonUpDown(plus: false, text: self.shared.weightStore, type: 0)
                        } label: {
                            ButtonPlus(size: size, text: "-")
                        }
                        ZStack {
                            Circle()
                                .strokeBorder(Color.buttonColor, lineWidth: 3)
                                .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                                .foregroundColor(.fieldWeight)
                            TextField("\(shared.weightStore)", text: $shared.weightStore)
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(Color.buttonColor)
                                .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                        }
                        Button {
                            self.shared.weightStore = shared.buttonUpDown(plus: true, text: self.shared.weightStore, type: 0)
                        } label: {
                            ButtonPlus(size: size, text: "+")
                        }
                    }
                }
                VStack {
                    Text("Цель")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)
                    HStack(spacing: size.scaleWidth(30)) {
                        Button {
                            self.shared.weightGoal = shared.buttonUpDown(plus: false, text: self.shared.weightGoal, type: 1)
                        } label: {
                            ButtonPlus(size: size, text: "-")
                        }
                        ZStack {
                            Circle()
                                .strokeBorder(Color.buttonColor, lineWidth: 3)
                                .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                                .foregroundColor(.fieldWeight)
                            TextField("\(shared.weightGoal)", text: $shared.weightGoal)
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(Color.buttonColor)
                                .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                        }
                        Button {
                            self.shared.weightGoal = shared.buttonUpDown(plus: true, text: self.shared.weightGoal, type: 1)
                        } label: {
                            ButtonPlus(size: size, text: "+")
                        }
                    }
                }.padding(.bottom, size.scaleHeight(30))
                
            }.frame(width: size.scaleWidth(358), height: size.scaleHeight(149))
            HStack {
                Spacer()
                Button {
                    withAnimation {
                        fillCircle = shared.percentNowGoal()
                        shared.setData(str: shared.weightStore)
                        weightSelect = false
                    }
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: size.scaleWidth(60), height: size.scaleHeight(60))
                            .foregroundColor(.black)
                        Image("check")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: size.scaleWidth(53), height: size.scaleHeight(51))
                    }
                }
            }.padding(.trailing, size.scaleWidth(25)).padding(.bottom, size.scaleHeight(25)).padding(.top, size.scaleHeight(358) - size.scaleHeight(50))
        }
    }
}

//struct Weight_Previews: PreviewProvider {
//    static var previews: some View {
//        Weight()
//    }
//}
