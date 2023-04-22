//
//  AuthView.swift
//  CaloriesApp
//
//  Created by Данила on 22.04.2023.
//

import SwiftUI

struct AuthView: View {
    @State var userEmail: String = ""
    @State var userPassword: String = ""
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                Image("logo")
                VStack(alignment: .leading, spacing: 13) {
                    Text("Логин")
                        .font(.system(size: 36, weight: .regular))
                        .padding(.leading, 26)
                    VStack {
                            TextField("Ваш логин", text: $userEmail)
                                .padding(.leading, 26)
                                .padding(.trailing, 26)
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.black)
                                .padding(.leading, 26)
                                .padding(.trailing, 26)
                        }
                }
                VStack(alignment: .leading, spacing: 13) {
                    Text("Пароль")
                        .font(.system(size: 36, weight: .regular))
                        .padding(.leading, 26)
                    VStack {
                            TextField("Ваш пароль", text: $userPassword)
                                .padding(.leading, 26)
                                .padding(.trailing, 26)
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.black)
                                .padding(.leading, 26)
                                .padding(.trailing, 26)
                        }
                }
                VStack {
                    HStack {
                        Button {
                            
                        } label: {
                            Text("Вход")
                                .frame(maxWidth: 100)
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold))
                                .padding()
                                .background(Color.buttonColor)
                                .cornerRadius(9)
                                
                        }
                        Button {
                            
                        } label: {
                            Text("Зарегестрироваться")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold))
                                .padding()
                                .background(Color.buttonColor)
                                .cornerRadius(9)
                        }

                    }
                    Button {
                        
                    } label: {
                        Text("Войти с Google")
                            .frame(maxWidth: 310)
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                            .padding()
                            .background(Color.buttonColor)
                            .cornerRadius(9)
                            
                    }
                    
                }.padding(.top, 30)
                ZStack {
                    Image("Vector1")
                        .resizable()
                        .padding(.top, 60)
                    Image("Vector2")
                        .resizable()
                        .padding(.top, 150)
                        
                }
                .ignoresSafeArea()
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
