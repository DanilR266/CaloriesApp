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
    @ObservedObject private var keyboardResponder = KeyboardResponder()
    @State var fieldName = false
    @State var fieldWeight = false
    @State var fieldKcal = false
    var size = Size()
    var body: some View {
        NavigationView {
            ZStack {
                Color.clear
                Color.backgroundColor.ignoresSafeArea()
                VStack {
                    ZStack(alignment: .top) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: size.screenWidth(), height: size.screenHeight())
                            .background(Color.field)
                            .cornerRadius(24)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        ScrollView(.vertical) {
                            if !(fieldName || fieldWeight || fieldKcal) {
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
                                    }.padding(.bottom, 5)
                                }
                            }
                            VStack {
                                VStack {
                                    Text("Изменить имя")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .bold))
                                        .frame(width: size.scaleWidth(339), alignment: .leading)
                                    ZStack(alignment: .leading) {
                                        TextField("\(viewModel.name)", text: $viewModel.name)
                                            .padding(.leading, 13)
                                            .font(.system(size: 24, weight: .regular))
                                            .onTapGesture {
                                                withAnimation {
                                                    self.fieldName = true
                                                }
                                            }
                                            .onSubmit {
                                                withAnimation {
                                                    self.fieldKcal = false
                                                    self.fieldName = false
                                                    self.fieldWeight = false
                                                }
                                            }
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: size.scaleWidth(339), height: size.scaleHeight(41))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 15)
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
                                        Spacer()
                                        TextField("\(viewModel.goalWeight)", text: $viewModel.goalWeight)
                                            .padding(.leading, 13)
                                            .font(.system(size: 24, weight: .regular))
                                            .onTapGesture {
                                                withAnimation {
                                                    self.fieldWeight = true
                                                }
                                            }
                                            .onSubmit {
                                                withAnimation {
                                                    self.fieldKcal = false
                                                    self.fieldName = false
                                                    self.fieldWeight = false
                                                }
                                            }
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: size.scaleWidth(339), height: size.scaleHeight(41))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 15)
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
                                            .onTapGesture {
                                                withAnimation {
                                                    self.fieldKcal = true
                                                }
                                            }
                                            .onSubmit {
                                                withAnimation {
                                                    self.fieldKcal = false
                                                    self.fieldName = false
                                                    self.fieldWeight = false
                                                }
                                            }
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: size.scaleWidth(339), height: size.scaleHeight(41))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 15)
                                                    .inset(by: 1)
                                                    .stroke(.black, lineWidth: 2)
                                            )
                                    }
                                }.padding(.leading, size.scaleWidth(22))
                            }.padding(.top, (fieldName || fieldKcal || fieldWeight) ? size.scaleHeight(75) : 0)
                            VStack {
                                if !(fieldName || fieldKcal || fieldWeight) {
                                    Button {
                                        viewModel.setData()
                                    } label: {
                                        ZStack {
                                            Rectangle()
                                                .frame(width: size.scaleWidth(313), height: size.scaleHeight(49))
                                                .cornerRadius(25)
                                                .foregroundColor(.backgroundColor)
                                                .shadow(radius: 3, y: 4)
                                            Text("Сохранить")
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .bold))
                                        }
                                    }
                                    Button {
                                        viewModel.signOut()
                                    } label: {
                                        ZStack {
                                            Rectangle()
                                                .frame(width: size.scaleWidth(313), height: size.scaleHeight(49))
                                                .cornerRadius(25)
                                                .foregroundColor(.backgroundColor)
                                                .shadow(radius: 3, y: 4)
                                            Text("Выйти")
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .bold))
                                        }
                                    }
                                }
                                else {
                                    Button {
                                        keyboardResponder.hideKeyboard()
                                        withAnimation {
                                            self.fieldKcal = false
                                            self.fieldName = false
                                            self.fieldWeight = false
                                        }
                                    } label: {
                                        ZStack {
                                            Rectangle()
                                                .frame(width: size.scaleWidth(313), height: size.scaleHeight(49))
                                                .cornerRadius(25)
                                                .foregroundColor(.backgroundColor)
                                                .shadow(radius: 3, y: 4)
                                            Text("ОК")
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .bold))
                                        }
                                    }.padding(.top, size.scaleHeight(30))
                                }
                            }.padding(.top, size.scaleHeight(20))
                        }.padding(.top, size.scaleHeight(35))
                            .ignoresSafeArea(.keyboard)
                    }.padding(.top, size.scaleHeight(200))
                }
            }
        }
        .onAppear {
            viewModel.getStored()
        }
    }
}

struct SettingsProfile_Previews: PreviewProvider {
    static var previews: some View {
        SettingsProfile()
    }
}
