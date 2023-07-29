//
//  CaloriesFronSide.swift
//  CaloriesApp
//
//  Created by Данила on 01.07.2023.
//

import SwiftUI

struct CaloriesFrontSide: View {
    var keyboardResponder: KeyboardResponder
    var size = Size()
    @Binding var degree: Double
//    @Binding var isFlipped: Bool
    @State var calories: String = ""
    @State var serv: String = ""
    @State var food: String = ""
    @ObservedObject var shared: CaloriesViewModel
//    @ObservedObject var keyboard: KeyboardObserver = KeyboardObserver()
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: size.scaleWidth(300), height: size.scaleHeight(505))
                .cornerRadius(18)
                .foregroundColor(Color.fieldWeight)
                .shadow(radius: 5)
            VStack(spacing: 20) {

                ViewAdd(keyboard: keyboardResponder, name: "Калории", type: $calories, keyboardType: .default)
                
                ViewAdd(keyboard: keyboardResponder, name: "Количество", type: $serv, keyboardType: .default)
                
                ViewAdd(keyboard: keyboardResponder, name: "Блюдо", type: $food, keyboardType: .default)
                
                Button {
//                    shared.calories += Int(calories) ?? 0
                    shared.addCalories(calorie: Int(calories) ?? 0)
                    calories = ""
                    keyboardResponder.hideKeyboard()
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: size.scaleWidth(240), height: size.scaleHeight(35))
                            .cornerRadius(7)
                            .foregroundColor(.buttonColor)
                        Text("Добавить")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                    }
                }.padding(.top, 15)
                Button {
                    withAnimation {
                        shared.flipCard()
                    }
//                    shared.getStored()
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: size.scaleWidth(240), height: size.scaleHeight(35))
                            .cornerRadius(7)
                            .foregroundColor(.buttonColor)
                        Text("Готово")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                    }
                }
            }
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}


struct ViewAdd: View {
    var keyboard: KeyboardResponder
    var name: String
    @Binding var type: String
    var keyboardType: UIKeyboardType
    var body: some View {
        VStack {
            Text(name)
                .foregroundColor(Color.buttonColor)
                .font(Font.custom("Montserrat", size: 32).weight(.bold))
                .multilineTextAlignment(.center)
            VStack(alignment: .center) {
                TextField("добавить", text: $type)
                    .frame(width: 220)
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 18, weight: .bold))
                    .keyboardType(keyboardType)
                    
                Rectangle()
                    .frame(width: 220, height: 5)
                    .foregroundColor(.white)
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
            }
        }
    }
}
