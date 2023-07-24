//
//  ButtonViews.swift
//  CaloriesApp
//
//  Created by Данила on 07.06.2023.
//

import SwiftUI

struct ButtonView: View {
    var offsetX: CGFloat
    var textButton: String
    var color: Color
    @Binding var height: Bool
    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(width: 324, height: (height ? 250 : 119))
                .animation(.spring(), value: height)
                .foregroundColor(color)
                .cornerRadius(18)
            ZStack {
                Circle()
                    .frame(width: 73, height: 73)
                    .foregroundColor(.black)
                    .offset(x: offsetX)
                Text(textButton)
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
            }
        }
    }
}


struct AllButtonts: View {
    @Binding var boolWeight: Bool
    @Binding var boolCalories: Bool
    @Binding var boolWater: Bool
    var body: some View {
        VStack() {
            ZStack {
                Button {
                    boolWeight.toggle()
                } label: {
                    ButtonView(offsetX: -38, textButton: "Вес", color: Color.fieldWeight, height: $boolWeight)
                }
                Button {
                    boolCalories.toggle()
                } label: {
                    ButtonView(offsetX: -73, textButton: "Калории", color: Color.fieldCalories, height: $boolCalories)
                }.offset(y: 150)
                Button {
                    
                } label: {
                    ButtonView(offsetX: -45, textButton: "Вода", color: Color.fieldWater, height: $boolWater)
                }.offset(y: 300)
            }.padding(.bottom, 400)
        }
    }
}

struct ButtonSetting: View {
//    var authModel: Authentication
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Rectangle()
                .frame(width: 23, height: 5)
                .foregroundColor(.black)
            Rectangle()
                .frame(width: 36, height: 5)
                .foregroundColor(.black)
            Rectangle()
                .frame(width: 49, height: 5)
                .foregroundColor(.black)
        }
    }
}

struct ButtonPlus: View {
    var size: Size
    var text: String
    var body: some View {
        ZStack {
            Circle()
                .frame(width: size.scaleWidth(40), height: size.scaleWidth(40))
                .foregroundColor(Color.buttonColor)
            Text(text)
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)
                .frame(width: size.scaleWidth(40), height: size.scaleWidth(40))
                .multilineTextAlignment(.center)
                .padding(.bottom, 3)
        }
    }
}
