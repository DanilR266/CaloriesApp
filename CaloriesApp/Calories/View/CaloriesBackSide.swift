//
//  CaloriesBackSide.swift
//  CaloriesApp
//
//  Created by Данила on 01.07.2023.
//

import SwiftUI

struct CaloriesBackSide: View {
    var size = Size()
    var keyboardResponder: KeyboardResponder
    @Binding var degree: Double
//    @Binding var isFlipped: Bool
    @State var rotate: Bool = false
    @State var amount: Int = 0
    @State var fastChange: Double = 0
    @State var valueFast: Int = 0
    @ObservedObject var shared: CaloriesViewModel
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: size.scaleWidth(300), height: size.scaleHeight(505))
                .cornerRadius(18)
                .foregroundColor(Color.fieldWeight)
                .shadow(radius: 5)
            VStack {
                Text("Калории")
                    .foregroundColor(Color.buttonColor)
                    .font(.system(size: 30, weight: .bold))
                    .multilineTextAlignment(.center)
    
                ZStack {
                    Circle()
                        .strokeBorder(Color.buttonColor, lineWidth: 2)
                        .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                        .foregroundColor(.fieldWeight)
                    Text("\(shared.calories)")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(Color.buttonColor)
                        .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                        .multilineTextAlignment(.center)
                }
                
                ProgressBar(amount: $shared.calories, shared: shared).padding(.top, 10)
                
                Button {
                    withAnimation {
                        shared.flipCard()
                    }
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
                VStack {
                    HStack {
                        Text("Быстрое изменение ")
                            .foregroundColor(Color.buttonColor)
                            .font(.system(size: 18, weight: .bold))
                            .multilineTextAlignment(.center)
                        ZStack {
                            Circle()
                                .strokeBorder(Color.buttonColor, lineWidth: 2)
                                .frame(width: size.scaleWidth(45), height: size.scaleWidth(45))
                                .foregroundColor(.fieldWeight)
                            Text("\(Int(fastChange))")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(Color.buttonColor)
                                .frame(width: size.scaleWidth(45), height: size.scaleWidth(45))
                                .multilineTextAlignment(.center)
                        }
                    }
                    Slider(value: $fastChange, in: -500...500, step: 10, onEditingChanged: { value in
                        if value == false {
                            withAnimation {
                                shared.fastCahngeCalories(fastChange: Int(fastChange))
                            }
                        }
                        withAnimation {
                            fastChange = 0
                        }
                        
                        
                    })
                        .frame(width: size.scaleWidth(240))
                        .accentColor(.buttonColor)
                }.padding(.top, 5)
            }
        }.rotation3DEffect(Angle.degrees(degree), axis: (0,1,0), perspective: 0.3)
            .opacity(keyboardResponder.keyboardIsShowing ? 0 : 1)
    }
}
