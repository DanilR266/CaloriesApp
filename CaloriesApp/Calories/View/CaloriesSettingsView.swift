//
//  CaloriesSettingsView.swift
//  CaloriesApp
//
//  Created by Данила on 17.07.2023.
//

import SwiftUI



struct CaloriesSettingsView: View {
    
    @StateObject var shared = CaloriesViewModel()
    var size = Size()
    var body: some View {
        ZStack {
            VStack {
                Text("Калории").font(.system(size: 20, weight: .bold)).padding(.bottom, size.scaleHeight(40))
                VStack {
                    Text("Цель").font(.system(size: 20, weight: .medium)).padding(.bottom, size.scaleHeight(20))
                    HStack {
                        Button {
                            withAnimation {
                                shared.selectedButton = TypeOfGoal.loss.rawValue
                            }
                        } label: {
                            ZStack(alignment: .center) {
                                Rectangle()
                                    .frame(width: size.scaleWidth(100), height: size.scaleHeight(30))
                                    .cornerRadius(7)
                                    .foregroundColor(shared.selectedButton == TypeOfGoal.loss.rawValue ? .fieldCalories : .buttonColor)
                                Text(TypeOfGoal.loss.rawValue)
                                    .foregroundColor(shared.selectedButton == TypeOfGoal.loss.rawValue ? .buttonColor : .white)
                                    .font(.system(size: 12, weight: .bold))
                                
                            }
                        }
                        
                        Button {
                            withAnimation {
                                shared.selectedButton = TypeOfGoal.gain.rawValue
                            }
                        } label: {
                            ZStack(alignment: .center) {
                                Rectangle()
                                    .frame(width: size.scaleWidth(100), height: size.scaleHeight(30))
                                    .cornerRadius(7)
                                    .foregroundColor(shared.selectedButton == TypeOfGoal.gain.rawValue ? .fieldCalories : .buttonColor)
                                Text(TypeOfGoal.gain.rawValue)
                                    .foregroundColor(shared.selectedButton == TypeOfGoal.gain.rawValue ? .buttonColor : .white)
                                    .font(.system(size: 12, weight: .bold))
                                
                            }
                        }
                        
                        Button {
                            withAnimation {
                                shared.selectedButton = TypeOfGoal.support.rawValue
                            }
                        } label: {
                            ZStack(alignment: .center) {
                                Rectangle()
                                    .frame(width: size.scaleWidth(100), height: size.scaleHeight(30))
                                    .cornerRadius(7)
                                    .foregroundColor(shared.selectedButton == TypeOfGoal.support.rawValue ? .fieldCalories : .buttonColor)
                                Text(TypeOfGoal.support.rawValue)
                                    .foregroundColor(shared.selectedButton == TypeOfGoal.support.rawValue ? .buttonColor : .white)
                                    .font(.system(size: 12, weight: .bold))
                    
                            }
                        }
                    }
                    Form {
                        Picker("Возраст", selection: $shared.age) {
                            ForEach(1...100, id: \.self) { number in
                                Text("\(number)")
                            }
                        }
                        Picker("Рост", selection: $shared.height) {
                            ForEach(100...300, id: \.self) { number in
                                Text("\(number)")
                            }
                        }
                    }.frame(height: 150).cornerRadius(9).background(Color.white).padding(.bottom, size.scaleHeight(25))
                    
                    Text("Активность").font(.system(size: 20, weight: .medium)).padding(.bottom, size.scaleHeight(20))
                    
                    VStack {
                        Button {
                            withAnimation {
                                shared.selectedActivity = Activity.no.rawValue
                            }
                        } label: {
                            ZStack(alignment: .center) {
                                Rectangle()
                                    .frame(width: size.scaleWidth(320), height: size.scaleHeight(30))
                                    .cornerRadius(7)
                                    .foregroundColor(shared.selectedActivity == Activity.no.rawValue ? .fieldCalories : .buttonColor)
                                Text(Activity.no.rawValue)
                                    .foregroundColor(shared.selectedActivity == Activity.no.rawValue ? .buttonColor : .white)
                                    .font(.system(size: 12, weight: .bold))
                                
                            }
                        }
                        
                        Button {
                            withAnimation {
                                shared.selectedActivity = Activity.oneTwo.rawValue
                            }
                        } label: {
                            ZStack(alignment: .center) {
                                Rectangle()
                                    .frame(width: size.scaleWidth(320), height: size.scaleHeight(30))
                                    .cornerRadius(7)
                                    .foregroundColor(shared.selectedActivity == Activity.oneTwo.rawValue ? .fieldCalories : .buttonColor)
                                Text(Activity.oneTwo.rawValue)
                                    .foregroundColor(shared.selectedActivity == Activity.oneTwo.rawValue ? .buttonColor : .white)
                                    .font(.system(size: 12, weight: .bold))
                                
                            }
                        }
                        
                        Button {
                            withAnimation {
                                shared.selectedActivity = Activity.threeFive.rawValue
                            }
                        } label: {
                            ZStack(alignment: .center) {
                                Rectangle()
                                    .frame(width: size.scaleWidth(320), height: size.scaleHeight(30))
                                    .cornerRadius(7)
                                    .foregroundColor(shared.selectedActivity == Activity.threeFive.rawValue ? .fieldCalories : .buttonColor)
                                Text(Activity.threeFive.rawValue)
                                    .foregroundColor(shared.selectedActivity == Activity.threeFive.rawValue ? .buttonColor : .white)
                                    .font(.system(size: 12, weight: .bold))
                                
                            }
                        }
                        
                        Button {
                            withAnimation {
                                shared.selectedActivity = Activity.moreFive.rawValue
                            }
                        } label: {
                            ZStack(alignment: .center) {
                                Rectangle()
                                    .frame(width: size.scaleWidth(320), height: size.scaleHeight(30))
                                    .cornerRadius(7)
                                    .foregroundColor(shared.selectedActivity == Activity.moreFive.rawValue ? .fieldCalories : .buttonColor)
                                Text(Activity.moreFive.rawValue)
                                    .foregroundColor(shared.selectedActivity == Activity.moreFive.rawValue ? .buttonColor : .white)
                                    .font(.system(size: 12, weight: .bold))
                                
                            }
                        }
                    }.padding(.bottom, size.scaleHeight(65))
                        
                    Button {
                        
                    } label: {
                        ZStack(alignment: .center) {
                            Rectangle()
                                .frame(width: size.scaleWidth(240), height: size.scaleHeight(35))
                                .cornerRadius(7)
                                .foregroundColor(.buttonColor)
                            Text("Сохранить")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold))
                            
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct CaloriesSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        CaloriesSettingsView()
    }
}
