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
        NavigationView {
            ZStack {
                Color.backgroundColor.edgesIgnoringSafeArea(.top)
                VStack {
//                    Text("Настройки")
//                        .font(.system(size: 32, weight: .bold))
//                        .multilineTextAlignment(.center)
//                        .foregroundColor(.white)
//                        .padding(.bottom, 50)
                    ZStack(alignment: .top) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: size.screenWidth(), height: size.screenHeight())
                            .background(Color.field)
                            .cornerRadius(24)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        ScrollView(.vertical) {
                            VStack(spacing: 10) {
                                Image("ava")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: size.scaleWidth(207), height: size.scaleHeight(207))
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(Color.black, lineWidth: 2)
                                    )
                                Button {
                                    
                                } label: {
                                    Text("Изменить фото")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .bold))
                                }
                            }
                            VStack {
                                VStack {
                                    Text("Изменить имя")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .bold))
                                        .frame(width: size.scaleWidth(339), alignment: .leading)
                                    ZStack(alignment: .leading) {
                                        TextField("Например: сыр", text: $viewModel.name)
                                            .padding(.leading, 13)
                                            .font(.system(size: 24, weight: .regular))
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: size.scaleWidth(339), height: size.scaleHeight(41))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 6)
                                                    .inset(by: 1)
                                                    .stroke(.black, lineWidth: 2)
                                            )
                                    }
                                }.padding(.leading, 22)
                                VStack(spacing: 10) {
                                    Text("Цель вес")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .bold))
                                        .frame(width: size.scaleWidth(339), alignment: .leading)
                                    ZStack(alignment: .leading) {
                                        TextField("\(viewModel.goalWeight)", text: $viewModel.goalWeight)
                                            .padding(.leading, 13)
                                            .font(.system(size: 24, weight: .regular))
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: size.scaleWidth(339), height: size.scaleHeight(41))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 6)
                                                    .inset(by: 1)
                                                    .stroke(.black, lineWidth: 2)
                                            )
                                    }
                                }.padding(.leading, 22)
                                VStack {
                                    Text("Цель калории")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .bold))
                                        .frame(width: size.scaleWidth(339), alignment: .leading)
                                    ZStack(alignment: .leading) {
                                        TextField("\(viewModel.goalCalories)", text: $viewModel.goalCalories)
                                            .padding(.leading, 13)
                                            .font(.system(size: 24, weight: .regular))
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: size.scaleWidth(339), height: size.scaleHeight(41))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 6)
                                                    .inset(by: 1)
                                                    .stroke(.black, lineWidth: 2)
                                            )
                                    }
                                }.padding(.leading, size.scaleWidth(22))
                            }
                            VStack {
                                Button {
                                    viewModel.setData()
                                } label: {
                                    ZStack(alignment: .center) {
                                        Rectangle()
                                            .frame(width: size.scaleWidth(285), height: size.scaleHeight(35))
                                            .cornerRadius(7)
                                            .foregroundColor(.regButton)
                                            .shadow(radius: 3, y: 4)
                                        Text("Сохранить")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .bold))
                                            .multilineTextAlignment(.center)
                                    }
                                }
                                Button {
                                    viewModel.signOut()
                                } label: {
                                    ZStack(alignment: .center) {
                                        Rectangle()
                                            .frame(width: size.scaleWidth(285), height: size.scaleHeight(35))
                                            .cornerRadius(7)
                                            .foregroundColor(.regButton)
                                            .shadow(radius: 3, y: 4)
                                        Text("Выйти")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .bold))
                                            .multilineTextAlignment(.center)
                                    }
                                }
                            }.padding(.top, size.scaleHeight(20))
                        }.padding(.top, size.scaleHeight(35))
                    }.padding(.top, size.scaleHeight(200))
                }
            }
        }.onAppear {
            viewModel.getStored()
        }
    }
}

struct SettingsProfile_Previews: PreviewProvider {
    static var previews: some View {
        SettingsProfile()
    }
}
