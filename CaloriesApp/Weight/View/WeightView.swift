//
//  WeightView.swift
//  CaloriesApp
//
//  Created by Данила on 07.06.2023.
//

import SwiftUI

public struct Weight: View {
    @StateObject var shared = WeightViewModel()
    @State var more: Bool = false
    var size = Size()
//    @State var text: String = String(WeightViewModel().getWeigth())
    public var body: some View {
        VStack() {
            ZStack {
                Rectangle()
                    .frame(width: size.scaleWidth(300), height: size.scaleHeight(175))
                    .cornerRadius(18)
                    .foregroundColor(Color.fieldWeight)
                    .shadow(radius: 5)
                VStack {
                    Text("Вес")
                        .foregroundColor(Color.buttonColor)
                        .font(.system(size: 32, weight: .bold))
                        .multilineTextAlignment(.center)
                    HStack(spacing: 27) {
                        Button {
                            self.shared.weightStore = shared.buttonUpDown(plus: false, text: self.shared.weightStore, type: 0)
                        } label: {
                            ButtonPlus(size: size, text: "-")
                        }
                        ZStack {
                            Circle()
                                .strokeBorder(Color.buttonColor, lineWidth: 2)
                                .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                                .foregroundColor(.fieldWeight)
                            TextField("", text: self.$shared.weightStore)
                                .font(.system(size: self.shared.weightStore.count > 5 ? 25 : 30, weight: .bold))
                                .foregroundColor(Color.buttonColor)
                                .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                                .multilineTextAlignment(.center)
                        }
                        Button {
                            self.shared.weightStore = shared.buttonUpDown(plus: true, text: self.shared.weightStore, type: 0)
                        } label: {
                            ButtonPlus(size: size, text: "+")
                        }
                    }
                }
            }
            
            Button {
                withAnimation(.linear(duration: 0.15)) {
                    more.toggle()
                }
            } label: {
                Text(more ? "Скрыть" : "Показать еще")
            }
            
            if more {
                ZStack {
                    Rectangle()
                        .frame(width: size.scaleWidth(300), height: size.scaleHeight(175))
                        .cornerRadius(18)
                        .foregroundColor(Color.fieldWeight)
                        .shadow(radius: 5)
                    VStack {
                        Text("Талия")
                            .foregroundColor(Color.buttonColor)
                            .font(.system(size: 32, weight: .bold))
                            .multilineTextAlignment(.center)
                        HStack(spacing: 27) {
                            Button {
                                self.shared.waist = shared.buttonUpDown(plus: false, text: self.shared.waist, type: 1)
                            } label: {
                                ButtonPlus(size: size, text: "-")
                            }
                            ZStack {
                                Circle()
                                    .strokeBorder(Color.buttonColor, lineWidth: 2)
                                    .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                                    .foregroundColor(.fieldWeight)
                                TextField("", text: self.$shared.waist)
                                    .font(.system(size: self.shared.waist.count > 5 ? 25 : 30, weight: .bold))
                                    .foregroundColor(Color.buttonColor)
                                    .frame(width: size.scaleWidth(91), height: size.scaleWidth(91))
                                    .multilineTextAlignment(.center)
                            }
                            Button {
                                self.shared.waist = shared.buttonUpDown(plus: true, text: self.shared.waist, type: 1)
                            } label: {
                                ButtonPlus(size: size, text: "+")
                            }
                        }
                    }
                }.padding(.top, 15)
            }
            
            Button {
                self.shared.setData(str: shared.weightStore)
            } label: {
                ZStack {
                    Rectangle()
                        .frame(width: size.scaleWidth(240), height: size.scaleHeight(35))
                        .cornerRadius(7)
                        .foregroundColor(.buttonColor)
                    Text("Сохранить изменения")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold))
                }
            }.padding(.top, 15)
            
        }.onAppear {
            shared.getStoredData()
        }
    }
}


//struct Weight_Previews: PreviewProvider {
//    static var previews: some View {
//        Weight()
//    }
//}
