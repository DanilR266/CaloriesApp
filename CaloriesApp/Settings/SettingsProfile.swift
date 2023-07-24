//
//  SettingsProfile.swift
//  CaloriesApp
//
//  Created by Данила on 06.07.2023.
//

import SwiftUI
import Foundation

struct SettingsProfile: View {
    @AppStorage("name") var userName = "User"
    var size = Size()
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Circle()
                        .frame(width: 133, height: 133)
                    Text("Сменить фото")
                        .font(
                            Font.custom("Montserrat", size: 20)
                                .weight(.medium)
                        )
                        .kerning(0.2)
                        .foregroundColor(.black)
                }
                VStack {
                    TextField("\(userName)", text: $userName)
                        .padding(.leading, 44)
                        .padding(.trailing, 44)
                    Rectangle()
                        .frame(height: 3)
                        .foregroundColor(.black)
                        .padding(.leading, 44)
                        .padding(.trailing, 44)
                }.padding(.top, size.scaleHeight(39))
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
                }.padding(.top, size.scaleHeight(65))
            }
            
        }
        
    }
}

struct SettingsProfile_Previews: PreviewProvider {
    static var previews: some View {
        SettingsProfile()
    }
}
