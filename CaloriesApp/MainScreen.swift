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
    
    @State var boolWeight: Bool = false
    @State var boolCalories: Bool = false
    @State var boolWater: Bool = false
    private var shared = MainViewModel()
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            ZStack {
                Image("Vector1-2")
                    .resizable()
                    .padding(.top, 650)
                Image("Vector2")
                    .resizable()
                    .padding(.top, 750)
                VStack(spacing: 70) {
                    HStack {
                        ButtonSetting()
                        Spacer()
                        HStack(spacing: 20) {
                            Text("Данил")
                                .foregroundColor(.black)
                                .font(.system(size: 30, weight: .bold))
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: 49, height: 49)
                        }.frame(maxWidth: 200)
                    }.padding(.trailing, 20).padding(.leading, 20)
                    if !boolWeight && !boolCalories && !boolWater {
                        AllButtonts(boolWeight: $boolWeight, boolCalories: $boolCalories, boolWater: $boolWater)
                    }
                    else if boolWeight && !boolCalories && !boolWater {
                        Weight(bool: $boolWeight)
                    }
                }.animation(.spring(), value: boolWeight)
                .animation(.spring(), value: boolCalories)
            }
//            AllButtonts(boolWeight: $boolWeight, boolCalories: $boolCalories, boolWater: $boolWater)
//            Weight()
            
        }.ignoresSafeArea()
    }
}

struct ButtonSetting: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Rectangle()
                .frame(width: 23, height: 5)
                .foregroundColor(.black)
            Rectangle()
                .frame(width: 36, height: 5)
                .foregroundColor(.black)
            Rectangle()
                .frame(width: 49, height: 5)
                .foregroundColor(.black)
        }
    }
}

struct ButtonView: View {
    var offsetX: CGFloat
    var textButton: String
    var color: Color
    @Binding var height: Bool
    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(width: 324, height: (height ? 250 : 119))
                .animation(.spring(), value: height)
                .foregroundColor(color)
                .cornerRadius(18)
            ZStack {
                Circle()
                    .frame(width: 73, height: 73)
                    .foregroundColor(.black)
                    .offset(x: offsetX)
                Text(textButton)
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
            }
        }
    }
}


struct AllButtonts: View {
    @Binding var boolWeight: Bool
    @Binding var boolCalories: Bool
    @Binding var boolWater: Bool
    var body: some View {
        VStack() {
            ZStack {
                Button {
                    boolWeight.toggle()
                } label: {
                    ButtonView(offsetX: -38, textButton: "Вес", color: Color.fieldWeight, height: $boolWeight)
                }
                Button {
                    boolCalories.toggle()
                } label: {
                    ButtonView(offsetX: -73, textButton: "Калории", color: Color.fieldCalories, height: $boolCalories)
                }.offset(y: 150)
                Button {
                    
                } label: {
                    ButtonView(offsetX: -45, textButton: "Вода", color: Color.fieldWater, height: $boolWater)
                }.offset(y: 300)
            }.padding(.bottom, 400)
        }
    }
}


//struct EditBlock: View {
//    var weightTap: Bool
//
//    var body: some View {
//
//    }
//}


struct VStackFiedlView: View {
    var textTop: String?
    var textIn: String
    var weight: CGFloat
    var fontSize: CGFloat
    var body: some View {
        VStack(spacing: 8) {
            if textTop != nil {
                Text(textTop!)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
            }
            ZStack {
                Circle()
                    .strokeBorder(.white, lineWidth: 1)
                    .background(Circle().fill(Color.buttonColor))
                    .frame(width: weight, height: weight)
                StrokeText(text: textIn, width: 0.5, color: .black)
                    .foregroundColor(.white)
                    .font(.system(size: fontSize, weight: .bold))
            }
        }
    }
}


struct NameOfBlock: View {
    var text: String
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: 110, maxHeight: 29)
                .foregroundColor(.buttonColor)
                .border(.black)
                .padding(.leading, 26)
                .padding(.trailing, 26)
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .bold))
        }.offset(y: -75)
    }
}

struct Weight: View {
    @Binding var bool: Bool
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 324, height: 507)
                .foregroundColor(Color.fieldWater)
                .cornerRadius(18)
                .offset(x: 30, y: 40)
            Rectangle()
                .frame(width: 324, height: 507)
                .foregroundColor(Color.fieldCalories)
                .cornerRadius(18)
                .offset(x: 0, y: 20)
            ZStack {
                Rectangle()
                    .frame(width: 324, height: 507)
                    .foregroundColor(Color.fieldWeight)
                    .cornerRadius(18)
                VStack {
                    Text("Вес")
                        .foregroundColor(.white)
                        .font(.system(size: 32, weight: .bold))
                        .onTapGesture {
                            bool.toggle()
                        }
                    HStack {
                        VStack(spacing: 70) {
                            Text("Сейчас")
                                .foregroundColor(.white)
                                .font(.system(size: 32, weight: .bold))
                            Text("Цель")
                                .foregroundColor(.white)
                                .font(.system(size: 32, weight: .bold))
                            Text("Осталось")
                                .foregroundColor(.white)
                                .font(.system(size: 32, weight: .bold))
                        }
                        VStack {
                            ZStack {
                                Circle()
                                    .strokeBorder(.white, lineWidth: 2)
                                    .frame(width: 91, height: 91)
                                    .foregroundColor(.fieldWeight)
                                Text("55")
                                    .font(.system(size: 30, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            ZStack {
                                Circle()
                                    .strokeBorder(.white, lineWidth: 2)
                                    .frame(width: 91, height: 91)
                                    .foregroundColor(.fieldWeight)
                                Text("50")
                                    .font(.system(size: 30, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            ZStack {
                                Circle()
                                    .strokeBorder(.white, lineWidth: 2)
                                    .frame(width: 91, height: 91)
                                    .foregroundColor(.fieldWeight)
                                Text("5")
                                    .font(.system(size: 30, weight: .bold))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    ZStack {
                        Circle()
                            .frame(width: 73, height: 73)
                            .foregroundColor(.black)
                            .offset(x: -68)
                        Text("Изменить показатели")
                            .frame(width: 200)
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                    }.offset(x: -20)
                }
                Button {
                    bool.toggle()
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 38, height: 38)
                            .foregroundColor(.black)
                        Text("X")
                            .foregroundColor(.white)
                    }
                }.offset(x: -110, y: -210)

            }.offset(x: -30)
        }.padding(.bottom, 100)
    }
}


//MARK:: ДЛЯ ИЗМЕНЕНИЯ
//HStack(spacing: 30) {
//    Button {
//
//    } label: {
//        ZStack {
//            Circle()
//                .frame(width: 43, height: 43)
//                .foregroundColor(.plusButton)
//                .shadow(radius: 3, y: 4)
//            Text("-").foregroundColor(.black).font(.system(size: 30, weight: .bold))
//        }
//    }
//
//    ZStack {
//        Circle()
//            .strokeBorder(.white, lineWidth: 2)
//            .frame(width: 91, height: 91)
//            .foregroundColor(.fieldWeight)
//        Text("55")
//            .font(.system(size: 30, weight: .bold))
//            .foregroundColor(.white)
//    }
//    Button {
//
//    } label: {
//        ZStack {
//            Circle()
//                .frame(width: 43, height: 43)
//                .foregroundColor(.plusButton)
//                .shadow(radius: 3, y: 4)
//            Text("+").foregroundColor(.black).font(.system(size: 30, weight: .bold))
//        }
//    }
//}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
