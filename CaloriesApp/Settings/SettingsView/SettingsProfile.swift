//
//  SettingsProfile.swift
//  CaloriesApp
//
//  Created by Данила on 06.07.2023.
//

import SwiftUI
import Foundation

struct SettingsProfile: View {
    @ObservedObject var viewModel = SettingsViewModel()
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
                    TextField("\(viewModel.userName)", text: $viewModel.userName)
                        .padding(.leading, 44)
                        .padding(.trailing, 44)
                    Rectangle()
                        .frame(height: 3)
                        .foregroundColor(.black)
                        .padding(.leading, 44)
                        .padding(.trailing, 44)
                }.padding(.top, size.scaleHeight(39))
                Button {
                    viewModel.updateName(name: viewModel.userName, docId: viewModel.docId)
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
                }.padding(.top, size.scaleHeight(35))
                Button {
                    viewModel.signOut()
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: size.scaleWidth(240), height: size.scaleHeight(35))
                            .cornerRadius(7)
                            .foregroundColor(.buttonColor)
                        Text("Выйти")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                    }
                }.padding(.top, size.scaleHeight(15))
            }
            
        }
        
    }
}

struct SettingsProfile_Previews: PreviewProvider {
    static var previews: some View {
        SettingsProfile()
    }
}
