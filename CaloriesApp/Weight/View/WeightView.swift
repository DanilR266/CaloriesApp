//
//  WeightView.swift
//  CaloriesApp
//
//  Created by Данила on 07.06.2023.
//

import SwiftUI

struct Weight: View {
    private var shared = WeightViewModel()
    var size = Size()
    @State var text: String = String(WeightViewModel().getWeigth())
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: size.scaleWidth(300), height: size.scaleHeight(505))
                .cornerRadius(18)
                .foregroundColor(Color.fieldWeight)
                .shadow(radius: 5)
            VStack {
                Text("Вес")
                    .foregroundColor(Color.buttonColor)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                HStack(spacing: 27) {
                    Button {
                        self.text = shared.buttonUpDown(plus: false, text: text)
                    } label: {
                        ButtonPlus(size: size, text: "-")
                    }
                    ZStack {
                        Circle()
                            .strokeBorder(Color.buttonColor, lineWidth: 2)
                            .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                            .foregroundColor(.fieldWeight)
                        TextField("", text: $text)
                            .font(.system(size: text.count > 5 ? 25 : 30, weight: .bold))
                            .foregroundColor(Color.buttonColor)
                            .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                            .multilineTextAlignment(.center)
                    }
                    Button {
                        self.text = shared.buttonUpDown(plus: true, text: text)
                    } label: {
                        ButtonPlus(size: size, text: "+")
                    }
                }
                Button {
                    shared.weightStore = Double(text)!
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: size.scaleWidth(240), height: size.scaleHeight(35))
                            .cornerRadius(7)
                            .foregroundColor(.buttonColor)
                        Text("Сохранить изменения")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                    }
                }.padding(.top, 45)

            }
        }
    }
}


struct Weight_Previews: PreviewProvider {
    static var previews: some View {
        Weight()
    }
}
