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
    var size = Size()
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 212, height: 83)
                    .offset(y: viewModel.regBool ? 70 : 0)
                    .animation(.spring(), value: viewModel.regBool)
                    .padding(.top, 40)
                    .opacity(keyboardResponder.keyboardIsShowing ? 0 : 1)
                VStack {
                    VStack(alignment: .leading, spacing: 13) {
                        Text("Логин")
                            .font(.system(size: 36, weight: .regular))
                            .padding(.leading, 24)
                            .foregroundColor(.white)
                        ZStack(alignment: .center) {
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: size.scaleWidth(339), height: size.scaleHeight(41))
                                .cornerRadius(6)
                                .overlay(
                                RoundedRectangle(cornerRadius: 6)
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
                        Text("Пароль")
                            .font(.system(size: 36, weight: .regular))
                            .padding(.leading, 24)
                            .foregroundColor(.white)
                        ZStack(alignment: .center) {
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: size.scaleWidth(339), height: size.scaleHeight(41))
                                .cornerRadius(6)
                                .overlay(
                                RoundedRectangle(cornerRadius: 6)
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
                    if viewModel.regBool {
                        VStack(alignment: .leading, spacing: 13) {
                            Text("Имя")
                                .font(.system(size: 36, weight: .regular))
                                .padding(.leading, 24)
                                .foregroundColor(.white)
                            ZStack(alignment: .center) {
                                Rectangle()
                                    .foregroundColor(.white)
                                    .frame(width: size.scaleWidth(339), height: size.scaleHeight(41))
                                    .cornerRadius(6)
                                    .overlay(
                                    RoundedRectangle(cornerRadius: 6)
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
                        }
                        VStack(spacing: 12) {
                            Button {
                                DispatchQueue.main.async {
                                    viewModel.registration(email: viewModel.userEmail, password: viewModel.userPassword, name: viewModel.userName)
                                    viewModel.updateDataReg()
                                }

                                viewModel.regBool = false
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: size.scaleWidth(285), height: size.scaleHeight(35))
                                        .cornerRadius(7)
                                        .foregroundColor(.regButton)
                                        .shadow(radius: 3, y: 4)
                                    Text("Регистрация")
//                                        .frame(maxWidth: 150)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .bold))
//                                        .offset(x: 62)
                                }
                            }
                            Button {
                                viewModel.regBool = false
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: size.scaleWidth(285), height: size.scaleHeight(35))
                                        .cornerRadius(7)
                                        .foregroundColor(.authButton)
                                        .shadow(radius: 3, y: 4)
                                    Text("Вход")
//                                        .frame(maxWidth: 100)
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .bold))
//                                        .offset(x: 25)
                                }
                            }
                        }.padding(.top, 40)
                    }
                }
                .offset(y: viewModel.regBool ? 70 : 0)
                .animation(.spring(), value: viewModel.regBool)
                VStack(spacing: 12) {
                    Button {
                        viewModel.login()
                        
                    } label: {
                        ZStack(alignment: .center) {
                            Rectangle()
                                .frame(width: size.scaleWidth(285), height: size.scaleHeight(35))
                                .cornerRadius(7)
                                .foregroundColor(.authButton)
                                .shadow(radius: 3, y: 4)
                            Text("Войти")
//                                .frame(maxWidth: size.scaleWidth(285))
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold))
                        }
                    }.offset(x: -offsetX)
                    Button {
                        viewModel.regBool = true
//                        viewModel.speach()
                    } label: {
                        ZStack(alignment: .center) {
                            Rectangle()
                                .frame(width: size.scaleWidth(285), height: size.scaleHeight(35))
                                .cornerRadius(7)
                                .foregroundColor(.regButton)
                                .shadow(radius: 3, y: 4)
                            Text("Регистрация")
//                                .frame(maxWidth: 150)
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold))
                                .multilineTextAlignment(.center)
//                                .offset(x: 62)
                        }
                    }.offset(x: offsetX)
                }.padding(.top, 30)
                    
                    .offset(y: viewModel.regBool ? 500 : 0)
                    .animation(.spring(), value: viewModel.regBool)
                Text(viewModel.errorRegistration ?? "").offset(y: viewModel.regBool ? 500 : 0)
                    .animation(.spring(), value: viewModel.regBool)
                Text(viewModel.errorAuth ?? "").offset(y: viewModel.regBool ? 500 : 0)
                    .animation(.spring(), value: viewModel.regBool)
                ZStack {
                    Image("Vector1-2")
                        .resizable()
                        .padding(.top, 60)
                    Image("Vector2")
                        .resizable()
                        .padding(.top, 150)
                }
                .padding(.top, 50)
                .ignoresSafeArea()
                .offset(y: viewModel.regBool ? 500 : 0)
                .animation(.spring(), value: viewModel.regBool)
            }
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


