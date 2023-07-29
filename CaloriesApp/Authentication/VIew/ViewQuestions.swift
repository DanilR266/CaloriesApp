//
//  ViewQuestions.swift
//  CaloriesApp
//
//  Created by Данила on 24.07.2023.
//

import SwiftUI

struct ViewQuestions: View {
    var size = Size()
    @State var selectedButton: String = TypeOfGoal.loss.rawValue
    @State var selectedActivity: String = Activity.no.rawValue
    @State var selectedSex: String = Sex.man.rawValue
    @State var age: Int = 18
    @State var height: Int = 170
    @State var weightNow: String = ""
    @State var weightGoal: String = ""
    @ObservedObject var viewModel: Authentication
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                Image("logo-2")
                    .resizable()
                    .frame(width: 212, height: 83)
                //                    .offset(y: viewModel.regBool ? 70 : 0)
                //                    .animation(.spring(), value: viewModel.regBool)
//                    .padding(.top, 40)
                //                    .opacity(keyboardResponder.keyboardIsShowing ? 0 : 1)
                Text("Расскажите о ваших целях").font(.system(size: 20, weight: .medium)).padding(.bottom, size.scaleHeight(20))
                VStack {
                    ScrollView {
                        Text("Цель").font(.system(size: 20, weight: .medium)).padding(.bottom, size.scaleHeight(20))
                        HStack {
                            Button {
                                withAnimation {
                                    selectedButton = TypeOfGoal.loss.rawValue
                                }
                            } label: {
                                ZStack(alignment: .center) {
                                    Rectangle()
                                        .frame(width: size.scaleWidth(100), height: size.scaleHeight(30))
                                        .cornerRadius(7)
                                        .foregroundColor(selectedButton == TypeOfGoal.loss.rawValue ? .fieldCalories : .buttonColor)
                                    Text(TypeOfGoal.loss.rawValue)
                                        .foregroundColor(selectedButton == TypeOfGoal.loss.rawValue ? .buttonColor : .white)
                                        .font(.system(size: 12, weight: .bold))
                                    
                                }
                            }
                            
                            Button {
                                withAnimation {
                                    selectedButton = TypeOfGoal.gain.rawValue
                                }
                            } label: {
                                ZStack(alignment: .center) {
                                    Rectangle()
                                        .frame(width: size.scaleWidth(100), height: size.scaleHeight(30))
                                        .cornerRadius(7)
                                        .foregroundColor(selectedButton == TypeOfGoal.gain.rawValue ? .fieldCalories : .buttonColor)
                                    Text(TypeOfGoal.gain.rawValue)
                                        .foregroundColor(selectedButton == TypeOfGoal.gain.rawValue ? .buttonColor : .white)
                                        .font(.system(size: 12, weight: .bold))
                                    
                                }
                            }
                            
                            Button {
                                withAnimation {
                                    selectedButton = TypeOfGoal.support.rawValue
                                }
                            } label: {
                                ZStack(alignment: .center) {
                                    Rectangle()
                                        .frame(width: size.scaleWidth(100), height: size.scaleHeight(30))
                                        .cornerRadius(7)
                                        .foregroundColor(selectedButton == TypeOfGoal.support.rawValue ? .fieldCalories : .buttonColor)
                                    Text(TypeOfGoal.support.rawValue)
                                        .foregroundColor(selectedButton == TypeOfGoal.support.rawValue ? .buttonColor : .white)
                                        .font(.system(size: 12, weight: .bold))
                                    
                                }
                            }
                        }
                        
                        Text("Пол").font(.system(size: 20, weight: .medium)).padding(.bottom, size.scaleHeight(20))
                        HStack {
                            Button {
                                withAnimation {
                                    selectedSex = Sex.man.rawValue
                                }
                            } label: {
                                ZStack(alignment: .center) {
                                    Rectangle()
                                        .frame(width: size.scaleWidth(150), height: size.scaleHeight(30))
                                        .cornerRadius(7)
                                        .foregroundColor(selectedSex == Sex.man.rawValue ? .fieldCalories : .buttonColor)
                                    Text(Sex.man.rawValue)
                                        .foregroundColor(selectedSex == Sex.man.rawValue ? .buttonColor : .white)
                                        .font(.system(size: 12, weight: .bold))
                                    
                                }
                            }
                            
                            Button {
                                withAnimation {
                                    selectedSex = Sex.woman.rawValue
                                }
                            } label: {
                                ZStack(alignment: .center) {
                                    Rectangle()
                                        .frame(width: size.scaleWidth(150), height: size.scaleHeight(30))
                                        .cornerRadius(7)
                                        .foregroundColor(selectedSex == Sex.woman.rawValue ? .fieldCalories : .buttonColor)
                                    Text(Sex.woman.rawValue)
                                        .foregroundColor(selectedSex == Sex.woman.rawValue ? .buttonColor : .white)
                                        .font(.system(size: 12, weight: .bold))
                                }
                            }
                        }
                        
                        
                        VStack {
                            Text("Активность").font(.system(size: 20, weight: .medium)).padding(.bottom, size.scaleHeight(20))
                            Button {
                                withAnimation {
                                    selectedActivity = Activity.no.rawValue
                                }
                            } label: {
                                ZStack(alignment: .center) {
                                    Rectangle()
                                        .frame(width: size.scaleWidth(320), height: size.scaleHeight(30))
                                        .cornerRadius(7)
                                        .foregroundColor(selectedActivity == Activity.no.rawValue ? .fieldCalories : .buttonColor)
                                    Text(Activity.no.rawValue)
                                        .foregroundColor(selectedActivity == Activity.no.rawValue ? .buttonColor : .white)
                                        .font(.system(size: 12, weight: .bold))
                                    
                                }
                            }
                            
                            Button {
                                withAnimation {
                                    selectedActivity = Activity.oneTwo.rawValue
                                }
                            } label: {
                                ZStack(alignment: .center) {
                                    Rectangle()
                                        .frame(width: size.scaleWidth(320), height: size.scaleHeight(30))
                                        .cornerRadius(7)
                                        .foregroundColor(selectedActivity == Activity.oneTwo.rawValue ? .fieldCalories : .buttonColor)
                                    Text(Activity.oneTwo.rawValue)
                                        .foregroundColor(selectedActivity == Activity.oneTwo.rawValue ? .buttonColor : .white)
                                        .font(.system(size: 12, weight: .bold))
                                    
                                }
                            }
                            
                            Button {
                                withAnimation {
                                    selectedActivity = Activity.threeFive.rawValue
                                }
                            } label: {
                                ZStack(alignment: .center) {
                                    Rectangle()
                                        .frame(width: size.scaleWidth(320), height: size.scaleHeight(30))
                                        .cornerRadius(7)
                                        .foregroundColor(selectedActivity == Activity.threeFive.rawValue ? .fieldCalories : .buttonColor)
                                    Text(Activity.threeFive.rawValue)
                                        .foregroundColor(selectedActivity == Activity.threeFive.rawValue ? .buttonColor : .white)
                                        .font(.system(size: 12, weight: .bold))
                                    
                                }
                            }
                            
                            Button {
                                withAnimation {
                                    selectedActivity = Activity.moreFive.rawValue
                                }
                            } label: {
                                ZStack(alignment: .center) {
                                    Rectangle()
                                        .frame(width: size.scaleWidth(320), height: size.scaleHeight(30))
                                        .cornerRadius(7)
                                        .foregroundColor(selectedActivity == Activity.moreFive.rawValue ? .fieldCalories : .buttonColor)
                                    Text(Activity.moreFive.rawValue)
                                        .foregroundColor(selectedActivity == Activity.moreFive.rawValue ? .buttonColor : .white)
                                        .font(.system(size: 12, weight: .bold))
                                    
                                }
                            }
                        }.padding(.top, size.scaleHeight(15))
                        
                        Form {
                            Picker("Возраст", selection: $age) {
                                ForEach(1...100, id: \.self) { number in
                                    Text("\(number)")
                                }
                            }
                            Picker("Рост", selection: $height) {
                                ForEach(100...300, id: \.self) { number in
                                    Text("\(number)")
                                }
                            }
                        }.frame(height: 150).cornerRadius(9).background(Color.white).padding(.bottom, size.scaleHeight(25))
                        
                        VStack {
                            TextField("Вес: сейчас (кг)", text: $weightNow)
                                .foregroundColor(.black)
                                .padding(.leading, 44)
                                .padding(.trailing, 44)
                            Rectangle()
                                .frame(height: 3)
                                .foregroundColor(.black)
                                .padding(.leading, 44)
                                .padding(.trailing, 44)
                        }
                        
                        VStack {
    //                            Text("Вес: сейчас (кг")
                            TextField("Вес: Цель (кг)", text: $weightGoal)
                                .foregroundColor(.black)
                                .padding(.leading, 44)
                                .padding(.trailing, 44)
                            Rectangle()
                                .frame(height: 3)
                                .foregroundColor(.black)
                                .padding(.leading, 44)
                                .padding(.trailing, 44)
                        }.padding(.bottom, 30)
                    }
                    
                    Button {
                        print(weightNow, type(of: weightNow))
                        viewModel.login()
                        viewModel.setDataAfterRegistration(goalCal: selectedButton, activity: selectedActivity, age: age, height: height, weightNow: weightNow, weightGoal: weightGoal, sex: selectedSex)
                        viewModel.calorieCalculator(weight: weightNow, height: height, age: age, sex: selectedSex, goal: selectedButton, activity: selectedActivity)
                    } label: {
                        ZStack(alignment: .center) {
                            Rectangle()
                                .frame(width: size.scaleWidth(240), height: size.scaleHeight(35))
                                .cornerRadius(7)
                                .foregroundColor(.buttonColor)
                            Text("Продолжить")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold))
                            
                        }
                    }
                }
            }
        }
    }
}

struct ViewQuestions_Previews: PreviewProvider {
    static var previews: some View {
        ViewQuestions(viewModel: Authentication())
    }
}
