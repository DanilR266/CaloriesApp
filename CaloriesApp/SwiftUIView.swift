//
//  SwiftUIView.swift
//  CaloriesApp
//
//  Created by Данила on 11.09.2023.
//

import SwiftUI

struct CustomTabBar: View {
    var size = Size()
    @Binding var tabBarItem: Int
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ZStack {
                    Rectangle()
                        .frame(width: size.screenWidth(), height: size.scaleHeight(77))
                        .foregroundColor(.tabbar)
                    HStack {
                        Button {
                            withAnimation(.linear(duration: 0.1)) {
                                tabBarItem = 0
                            }
                        } label: {
                            ZStack {
                                Circle()
                                    .frame(width: size.scaleWidth(70), height: size.scaleHeight(70))
                                    .foregroundColor(.tabbar)
                                VStack(alignment: .center) {
                                    Image(systemName: "gearshape")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(tabBarItem == 0 ? Color.fieldCalories : Color.white)
                                    Text("Настройки")
                                        .font(.system(size: 12))
                                        .foregroundColor(.white)
                                }
                            }.offset(y: tabBarItem == 0 ? -10 : 0)
                        }
                        Spacer()
                        Button {
                            withAnimation(.linear(duration: 0.1)) {
                                tabBarItem = 1
                            }
                        } label: {
                            ZStack {
                                Circle()
                                    .frame(width: size.scaleWidth(70), height: size.scaleHeight(70))
                                    .foregroundColor(.tabbar)
                                VStack(alignment: .center) {
                                    Image(systemName: "house")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(tabBarItem == 1 ? Color.fieldCalories : Color.white)
                                    Text("Главная")
                                        .font(.system(size: 12))
                                        .foregroundColor(.white)
                                }
                            }.offset(y: tabBarItem == 1 ? -10 : 0)
                        }
                        Spacer()
                        Button {
                            withAnimation(.linear(duration: 0.1)) {
                                tabBarItem = 2
                            }
                        } label: {
                            ZStack {
                                Circle()
                                    .frame(width: size.scaleWidth(70), height: size.scaleHeight(70))
                                    .foregroundColor(.tabbar)
                                VStack(alignment: .center) {
                                    Image(systemName: "chart.bar")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(tabBarItem == 2 ? Color.fieldCalories : Color.white)
                                    Text("Прогресс")
                                        .font(.system(size: 12))
                                        .foregroundColor(.white)
                                }
                            }.offset(y: tabBarItem == 2 ? -10 : 0)
                        }
                    }.padding(.leading, 40).padding(.trailing, 40)
                }
            }
        }.ignoresSafeArea()
    }
}
