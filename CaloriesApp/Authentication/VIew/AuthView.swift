//
//  AuthView.swift
//  CaloriesApp
//
//  Created by Данила on 22.04.2023.
//

import SwiftUI

struct AuthView: View {
    @ObservedObject private var keyboardResponder = KeyboardResponder()
    @ObservedObject var viewModel: Authentication
    @State var offsetX: CGFloat = 500
    @State var offsetRegistration: CGFloat = 0
    @State var offsetLogIn: CGFloat = -500
    var size = Size()
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 212, height: 83)
                    .animation(.spring(), value: viewModel.regBool)
                    .padding(.bottom, 100)
                    .opacity(keyboardResponder.keyboardIsShowing ? 0 : 1)
                VStack(spacing: 15) {
                    VStack(alignment: .leading, spacing: 13) {
                        ZStack(alignment: .center) {
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: size.scaleWidth(339), height: size.scaleHeight(41))
                                .cornerRadius(15)
                                .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .inset(by: 1)
                                    .stroke(.black, lineWidth: 2)
                                )
                            HStack(spacing: 12) {
                                Image(systemName: "person")
//                                    .padding(.leading, 13)
                                    .foregroundColor(.black)
                                TextField("Логин", text: $viewModel.userEmail)
//                                    .padding(.leading, 43)
                                    .font(.system(size: 24, weight: .regular))
                            }.padding(.leading, 24)
                        }
                    }
                    VStack(alignment: .leading, spacing: 13) {
                        ZStack(alignment: .center) {
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: size.scaleWidth(339), height: size.scaleHeight(41))
                                .cornerRadius(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .inset(by: 1)
                                        .stroke(.black, lineWidth: 2)
                                )
                            HStack(spacing: 12) {
                                Image(systemName: "lock")
                                    .foregroundColor(.black)
                                SecureField("Пароль", text: $viewModel.userPassword)
                                    .font(.system(size: 24, weight: .regular))
                                    .textContentType(.newPassword)
                            }.padding(.leading, 24)
                        }
                    }
                    ZStack(alignment: .top) {
                        VStack() {
                            VStack(alignment: .leading, spacing: 13) {
                                ZStack(alignment: .center) {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(width: size.scaleWidth(339), height: size.scaleHeight(41))
                                        .cornerRadius(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .inset(by: 1)
                                                .stroke(.black, lineWidth: 2)
                                        )
                                    HStack(spacing: 12) {
                                        Image(systemName: "person")
                                            .foregroundColor(.black)
                                        TextField("Имя", text: $viewModel.userName)
                                            .font(.system(size: 24, weight: .regular))
                                    }.padding(.leading, 24)
                                }
                            }.padding(.bottom, 28)
                            Button {
                                DispatchQueue.main.async {
                                    viewModel.registration(email: viewModel.userEmail, password: viewModel.userPassword, name: viewModel.userName)
                                    viewModel.updateDataReg()
                                    viewModel.userName = ""
                                }

                                viewModel.regBool = false
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: size.scaleWidth(313), height: size.scaleHeight(49))
                                        .cornerRadius(25)
                                        .foregroundColor(.fieldWeight)
                                        .shadow(radius: 3, y: 4)
                                    Text("Регистрация")
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .bold))
                                }
                            }
                            HStack {
                                Text("Уже есть аккаунт?")
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(.white)
                                Button {
                                    viewModel.regBool = false
                                    withAnimation {
                                        self.offsetRegistration = 500
                                        self.offsetLogIn = 0
                                    }
                                } label: {
                                    Text("Войти")
                                        .font(.system(size: 16, weight: .bold))
                                }

                            }
                        }.padding(.top, 0)
                            .offset(x: offsetRegistration)
                        
                        VStack() {
                            Button {
                                viewModel.login()
                            } label: {
                                ZStack(alignment: .center) {
                                    Rectangle()
                                        .frame(width: size.scaleWidth(313), height: size.scaleHeight(49))
                                        .cornerRadius(25)
                                        .foregroundColor(.fieldWeight)
                                        .shadow(radius: 3, y: 4)
                                    Text("Войти")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .bold))
                                }

                            }.offset(x: -offsetX)
                            HStack {
                                Text("Хотите создать аккаунт?")
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(.white)
                                Button {
                                    viewModel.regBool = true
                                    withAnimation {
                                        self.offsetRegistration = 0
                                        self.offsetLogIn = -500
                                    }
                                } label: {
                                    Text("Регистрация")
                                        .font(.system(size: 16, weight: .bold))
                                }

                            }
                        }.padding(.top, 28)
                            .offset(x: offsetLogIn)
                    }
                }
//                Text(viewModel.errorRegistration ?? "")
//                Text(viewModel.errorAuth ?? "")
            }.padding(.top, 0)
        }.onAppear {
            withAnimation {
                self.offsetX = 0
            }
        }
    }
}

struct FieldView: View {
    var text: String
    var body: some View {
        VStack(spacing: 13) {
            Text(text)
                .font(.system(size: 36, weight: .regular))
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(viewModel: Authentication())
    }
}













//                ZStack {
//                    Image("Vector1-2")
//                        .resizable()
//                        .padding(.top, 60)
//                    Image("Vector2")
//                        .resizable()
//                        .padding(.top, 150)
//                }
//                .padding(.top, 50)
//                .ignoresSafeArea()
////                .offset(y: viewModel.regBool ? 500 : 0)
//                .animation(.spring(), value: viewModel.regBool)
