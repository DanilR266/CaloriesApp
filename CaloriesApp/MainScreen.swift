//
//  MainScreen.swift
//  CaloriesApp
//
//  Created by Данила on 25.04.2023.
//

import Foundation
import SwiftUI
import Firebase

struct MainScreenTabView: View {
    @StateObject var authModel: Authentication
    @State var selectedTab = 1
    var size = Size()
    var body: some View {
//        ZStack {
//            Color.backgroundColor
//            VStack {
//                if selectedTab == 0 {
//                    SettingsProfile()
//                        .padding(.top, size.scaleHeight(70))
//                }
//                if selectedTab == 1 {
//                    MainScreen(authModel: authModel)
//                }
//                if selectedTab == 2 {
//                    ProgressView()
//                        .padding(.top, size.scaleHeight(40))
//                }
//                Spacer()
//                CustomTabBar(tabBarItem: $selectedTab)
//                    .frame(width: size.screenWidth(), height: size.scaleHeight(77))
//                    .foregroundColor(.tabbar)
//            }
//        }.ignoresSafeArea()
        MainScreen(authModel: authModel)
    }
}

struct MainScreen: View {
    @AppStorage("auth") var authenticated = true
    @State var boolWeight: Bool = false
    @State var boolCalories: Bool = false
    @State var boolWater: Bool = false
    @State private var selectedTab = 1
    @State private var selected = 1
    @State var menu: Bool = false
    var size = Size()
    @StateObject var authModel: Authentication
    
    var body: some View {
        MainView(authModel: authModel)
            .onAppear { authModel.getStoredData() }
//        TabView(selection: $selected) {
//            SettingsMain()
//                .tag(0)
//                .tabItem {
//                    Text("Настройки")
//                }
//            MainView(authModel: authModel)
//                .onAppear { authModel.getStoredData() }
//                .tag(1)
//                .tabItem {
//                    Text("Главная")
//                }
//            ProgressView()
//                .tag(2)
//                .tabItem {
//                    Text("Прогресс")
//                }
//        }.tabViewStyle(.page)
    }
}


struct MainView: View {
    var size = Size()
    @State private var selection: String? = nil
    @StateObject var authModel: Authentication
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                ZStack {
                    Color.backgroundColor.edgesIgnoringSafeArea(.top)
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Приветсвую,")
                                    .font(.system(size: 24, weight: .medium))
                                    .foregroundColor(.white)
                                Text(authModel.userName)
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            Image("ava")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: size.scaleWidth(64), height: size.scaleHeight(64))
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.black, lineWidth: 2)
                                )
                        }.padding(.trailing, 40).padding(.leading, 40).padding(.bottom, 40)
                        HStack(spacing: 30) {
                            Spacer()
                            NavigationLink {
                                SettingsMain()
                            } label: {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.white)
                                    .frame(width: size.scaleWidth(30), height: size.scaleHeight(30))
                            }
                            
                            NavigationLink {
                                ProgressView()
                            } label: {
                                Image(systemName: "chart.bar.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.white)
                                    .frame(width: size.scaleWidth(30), height: size.scaleHeight(30))
                            }
                        }.padding(.bottom, 30).padding(.trailing, 24)
                        ZStack(alignment: .top) {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: size.screenWidth(), height: size.screenHeight())
                                .background(Color.field)
                                .cornerRadius(24)
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                            ScrollView(.vertical) {
                                Rectangle()
                                    .foregroundColor(Color.field)
                                    .frame(width: size.screenWidth(), height: 1)
                                NavigationLink {
                                    Weight()
                                } label: {
                                    ButtonMainScreen(text: "Измерения тела", size: size)
                                }
                                NavigationLink {
                                    MainCalories().navigationBarBackButtonHidden(false)
                                } label: {
                                    ButtonMainScreen(text: "Калории", size: size)
                                }
                                NavigationLink {
//                                    WaterView()
                                } label: {
                                    ButtonMainScreen(text: "Вода", size: size)
                                }
                                NavigationLink {
                                    
                                } label: {
                                    ButtonMainScreen(text: "Тренировки", size: size)
                                }
                                Rectangle()
                                    .foregroundColor(Color.field)
                                    .frame(width: size.screenWidth(), height: 1)
                            }.padding(.top, 20)
                                .frame(width: size.screenWidth())
                                
                        }
                        
                    }.padding(.top, 175)
                }
            }.padding(.top, size.scaleHeight(150))
        }
    }
}

struct ButtonMainScreen: View {
    var text: String
    var size: Size
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
              .foregroundColor(.white)
              .frame(width: size.scaleWidth(327), height: size.scaleHeight(76))
              .cornerRadius(18)
              .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: -2, y: -2)
              .shadow(color: Color.fieldCalories.opacity(0.25), radius: 2, x: 3, y: 4)
            Text(text)
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.black)
        }

    }
}



//struct MainScreen_Previews: PreviewProvider {
//    @StateObject var authModel = Authentication()
//    static var previews: some View {
//        MainScreen(authModel: authModel)
//    }
//}
