//
//  AuthView.swift
//  CaloriesApp
//
//  Created by Данила on 22.04.2023.
//

import SwiftUI

struct AuthView: View {
    @ObservedObject private var keyboardResponder = KeyboardResponder()
    @ObservedObject var viewModel = Authentication()
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                Image("logo-2")
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
                            .padding(.leading, 44)
                        VStack {
                            TextField("Ваш логин", text: $viewModel.userEmail)
                                .foregroundColor(.black)
                                .padding(.leading, 44)
                                .padding(.trailing, 44)
                            Rectangle()
                                .frame(height: 3)
                                .foregroundColor(.black)
                                .padding(.leading, 44)
                                .padding(.trailing, 44)
                        }
                    }
                    VStack(alignment: .leading, spacing: 13) {
                        Text("Пароль")
                            .font(.system(size: 36, weight: .regular))
                            .padding(.leading, 44)
                        VStack {
                            SecureField("Ваш пароль", text: $viewModel.userPassword)
                                .padding(.leading, 44)
                                .padding(.trailing, 44)
                            
                            Rectangle()
                                .frame(height: 3)
                                .foregroundColor(.black)
                                .padding(.leading, 44)
                                .padding(.trailing, 44)
                        }
                    }
                    if viewModel.regBool {
                        VStack(alignment: .leading, spacing: 13) {
                            Text("Имя")
                                .font(.system(size: 36, weight: .regular))
                                .padding(.leading, 44)
                            VStack {
                                TextField("Ваше имя", text: $viewModel.name)
                                    .padding(.leading, 44)
                                    .padding(.trailing, 44)
                                Rectangle()
                                    .frame(height: 3)
                                    .foregroundColor(.black)
                                    .padding(.leading, 44)
                                    .padding(.trailing, 44)
                            }
                        }
                        HStack(spacing: 60) {
                            Button {
                                DispatchQueue.main.async {
                                    viewModel.registration(email: viewModel.userEmail, password: viewModel.userPassword, name: viewModel.name)
                                    viewModel.userPassword = ""
                                }

                                viewModel.regBool = false
                            } label: {
                                ZStack {
                                    Circle()
                                        .foregroundColor(Color.regButton)
                                        .frame(width: 59, height: 59)
                                        .shadow(radius: 3, y: 4)
                                    Text("Регистрация")
                                        .frame(maxWidth: 150)
                                        .foregroundColor(.black)
                                        .font(.system(size: 20, weight: .bold))
                                        .offset(x: 62)
                                }
                            }
                            Button {
                                viewModel.regBool = false
                            } label: {
                                ZStack {
                                    Circle()
                                        .foregroundColor(Color.regButton)
                                        .frame(width: 59, height: 59)
                                        .shadow(radius: 3, y: 4)
                                    Text("Вход")
                                        .frame(maxWidth: 100)
                                        .foregroundColor(.black)
                                        .font(.system(size: 20, weight: .bold))
                                        .offset(x: 25)
                                }
                            }
                        }.padding(.top, 40).padding(.trailing, 100)
                    }
                }
                .offset(y: viewModel.regBool ? 70 : 0)
                .animation(.spring(), value: viewModel.regBool)
                HStack(spacing: 40) {
                    Button {
                        viewModel.login(email: viewModel.userEmail, password: viewModel.userPassword)
                        
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(Color.regButton)
                                .frame(width: 59)
                                .shadow(radius: 3, y: 4)
                            Text("Войти")
                                .frame(maxWidth: 100)
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .bold))
                                .offset(x: 30)
                        }
                    }
                    Button {
                        viewModel.regBool = true
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(Color.regButton)
                                .frame(width: 59)
                                .shadow(radius: 3, y: 4)
                            Text("Регистрация")
                                .frame(maxWidth: 150)
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .bold))
                                .offset(x: 62)
                        }
                            
                    }
                }.padding(.leading, -70).padding(.top, 30)
                    
                    .offset(y: viewModel.regBool ? 500 : 0)
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
        AuthView()
    }
}


