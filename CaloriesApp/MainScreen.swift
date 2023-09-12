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
        ZStack {
            Color.backgroundColor
            VStack {
                if selectedTab == 0 {
                    SettingsProfile()
                        .padding(.top, size.scaleHeight(70))
                }
                if selectedTab == 1 {
                    MainScreen(authModel: authModel)
                }
                if selectedTab == 2 {
                    ProgressView()
                        .padding(.top, size.scaleHeight(40))
                }
                Spacer()
                CustomTabBar(tabBarItem: $selectedTab)
                    .frame(width: size.screenWidth(), height: size.scaleHeight(77))
                    .foregroundColor(.tabbar)
            }
        }.ignoresSafeArea()
    }
}

struct MainScreen: View {
    @ObservedObject private var keyboardResponder = KeyboardResponder()
    @State var boolWeight: Bool = false
    @State var boolCalories: Bool = false
    @State var boolWater: Bool = false
    @State private var selectedTab = 1
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
                            VStack(alignment: .leading) {
                                Text("Приветсвую,")
                                    .font(.system(size: 24, weight: .medium))
                                    .foregroundColor(.black)
                                Text(authModel.userName)
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(.black)
                            }
                            Spacer()
                            Circle()
                                .foregroundColor(.black)
                                .frame(width: 64, height: 64)
                        }.padding(.trailing, 40).padding(.leading, 40).opacity(menu ? 0 : 1)
                        
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
            }
//            .ignoresSafeArea()
        }
    }
}



//struct MainScreen_Previews: PreviewProvider {
//    @StateObject var authModel = Authentication()
//    static var previews: some View {
//        MainScreen(authModel: authModel)
//    }
//}
