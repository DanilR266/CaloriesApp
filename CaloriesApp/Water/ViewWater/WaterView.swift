//
//  WaterView.swift
//  CaloriesApp
//
//  Created by Данила on 19.07.2023.
//

import SwiftUI

struct WaterView: View {
    var size = Size()
    @ObservedObject var shared = WaterViewModel()
    @State var text: String = "0"
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: size.scaleWidth(300), height: size.scaleHeight(505))
                .cornerRadius(18)
                .foregroundColor(Color.fieldWeight)
                .shadow(radius: 5)
            VStack {
                Text("Вода")
                    .foregroundColor(Color.buttonColor)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                HStack(spacing: 20) {
                    Text("Выпито сегодня")
                    ZStack {
                        Circle()
                            .strokeBorder(Color.buttonColor, lineWidth: 2)
                            .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                            .foregroundColor(.fieldWeight)
                        Text("1Л")
                            .font(.system(size: text.count > 5 ? 25 : 30, weight: .bold))
                            .foregroundColor(Color.buttonColor)
                            .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                            .multilineTextAlignment(.center)
                    }
                }.padding(.bottom, 20)
                HStack(spacing: 27) {
                    Button {
                        
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
                        
                    } label: {
                        ButtonPlus(size: size, text: "+")
                    }
                }
                Button {
                    
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

struct WaterView_Previews: PreviewProvider {
    static var previews: some View {
        WaterView()
    }
}
