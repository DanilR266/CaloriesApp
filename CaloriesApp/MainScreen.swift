//
//  MainScreen.swift
//  CaloriesApp
//
//  Created by Данила on 25.04.2023.
//

import Foundation
import SwiftUI
import Firebase


struct MainScreen: View {
    @ObservedObject private var keyboardResponder = KeyboardResponder()
    @State var boolWeight: Bool = false
    @State var boolCalories: Bool = false
    @State var boolWater: Bool = false
    @State private var selectedTab = 0
    @State private var selected = 2
    @State var menu: Bool = false
    var size = Size()
    @StateObject var authModel: Authentication
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                ZStack {
                    Color.backgroundColor.ignoresSafeArea()
                    VStack(spacing: 0) {
                        HStack {
                            Button {
                                withAnimation {
                                    menu.toggle()
                                }
                            } label: {
                                ButtonSetting()
                            }

                            
                            Spacer()
                            
                            HStack(spacing: 20) {
                                Text("\(authModel.userName)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 30, weight: .bold))
                                Circle()
                                    .foregroundColor(.black)
                                    .frame(width: 49, height: 49)
                            }.frame(maxWidth: 200)
                        }.padding(.trailing, 20).padding(.leading, 20).opacity(menu ? 0 : 1)
                        
                        TabView(selection: $selectedTab, content: {
                            Weight().tag(0).scaleEffect(selectedTab == 0 ? 1 : 0.8) .animation(.linear(duration: 0.3), value: selectedTab)
                                
                            MainCalories(keyboardResponder: keyboardResponder).tag(1).scaleEffect(selectedTab == 1 ? 1 : 0.8)
                                .animation(.linear(duration: 0.3), value: selectedTab)
                                
                            WaterView().tag(2).scaleEffect(selectedTab == 2 ? 1 : 0.8)
                                .animation(.linear(duration: 0.3), value: selectedTab)
                                
                        })
                        .tabViewStyle(.page)
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                        .frame(width: size.screenWidth(), height: size.scaleHeight(595))
                        .offset(x: menu ? size.screenWidth()/2 : 0)
                    }
                }.opacity(!menu ? 1 : 0.5).scaleEffect(menu ? 0.8 : 1).disabled(menu)
                    .offset(y: keyboardResponder.keyboardIsShowing ? -size.scaleHeight(75) : 0)
                VStack(alignment: .leading, spacing: 30) {
                    Button {
                        withAnimation { menu.toggle() }
                    } label: {
                        HStack(spacing: 0) {
                            Circle()
                                .foregroundColor(Color.regButton)
                                .frame(width: size.scaleWidth(59), height: size.scaleHeight(59))
                                .shadow(radius: 3, y: 4)
                            Text("Вернуться")
//                                .frame(width: size.scaleWidth(117))
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .bold))
                                .offset(x: -size.scaleWidth(59)/2)
                        }
                    }.offset(x: menu ? 0 : -size.screenWidth())
                    
                    NavigationLink {
                        SettingsMain()
                    } label: {
                        HStack(spacing: 0) {
                            Circle()
                                .foregroundColor(Color.regButton)
                                .frame(width: size.scaleWidth(59), height: size.scaleHeight(59))
                                .shadow(radius: 3, y: 4)
                            Text("Настройки")
//                                .frame(width: size.scaleWidth(121))
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .bold))
                                .offset(x: -size.scaleWidth(59)/2)
                        }
                    }.offset(x: menu ? 0 : -size.screenWidth() * 5)
                    NavigationLink {
                        ProgressView()
                    } label: {
                        HStack(spacing: 0) {
                            Circle()
                                .foregroundColor(Color.fieldCalories)
                                .frame(width: size.scaleWidth(59), height: size.scaleHeight(59))
                                .shadow(radius: 3, y: 4)
                            Text("Отчетность")
//                                .frame(width: size.scaleWidth(72))
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .bold))
                                .offset(x: -size.scaleWidth(59)/2)
                        }
                    }.offset(x: menu ? 0 : -size.screenWidth() * 10)
                }.padding(.leading, menu ? 50 : 0)
                    .padding(.top, 100)
            }
            .ignoresSafeArea()
        }
    }
}



//struct MainScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        MainScreen()
//    }
//}
