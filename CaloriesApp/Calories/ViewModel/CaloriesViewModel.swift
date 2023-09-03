//
//  CaloriesViewModel.swift
//  CaloriesApp
//
//  Created by Данила on 29.06.2023.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore

class CaloriesViewModel: ObservableObject {
    let modelCalories = ModelCalories()
    @AppStorage("calories") var calories: Int = 0 {
        willSet { objectWillChange.send() }
    }
    @AppStorage("CaloriesGoal") var caloriesGoal = 0 {
        willSet { objectWillChange.send() }
    }
    @AppStorage("id") var docId = ""
    
    @Published var calForView: Int = 0
    
    @Published var backDegree = 0.0
    @Published var frontDegree = -90.0
    @Published var isFlipped = false
    
    @Published var selectedButton: String = TypeOfGoal.loss.rawValue
    @Published var selectedActivity: String = Activity.no.rawValue
    @Published var age: Int = 1
    @Published var height: Int = 170
    
    let durationAndDelay : CGFloat = 0.15
    
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
    
    func amountBar(amount: Int, max: Int) -> Int {
        return amount * 300 / max
    }
    
    func addCalories(calorie: Int) {
        self.calories += calorie
//        self.calForView = calorie
        self.setData(number: self.calories)
    }
    
    func fastCahngeCalories(fastChange: Int) {
        self.calories = self.calories + fastChange >= 0  ? self.calories + fastChange : self.calories
        self.setData(number: self.calories)
    }
    
    func getStoredData() {
        modelCalories.getStoredData(docId: docId) { calories, error in
            self.calories = calories ?? 0
        }
    }
    
    func setData(number: Int) {
        modelCalories.setData(number: number, docId: docId)
    }
    
    func calorieCalculator(weight: String, height: Int, age: Int, sex: String, goal: String, activity: String) -> Int {
        var caloriesOne: Double = 0
        switch sex {
        case Sex.man.rawValue:
            let help1 = (13.397 * Double(weight)!)
            let help2 = (4.799 * Double(height)) - (5.677 * Double(age))
            caloriesOne = 88.362 + help1 + help2
        default:
            let help1 = (9.247 * Double(weight)!)
            let help2 = (3.098 * Double(height)) - (4.330 * Double(age))
            caloriesOne = 447.593 + help1 + help2
        }
        switch activity {
        case Activity.no.rawValue:
            caloriesOne *= 1.2
        case Activity.oneTwo.rawValue:
            caloriesOne *= 1.375
        case Activity.threeFive.rawValue:
            caloriesOne *= 1.55
        default:
            caloriesOne *= 1.725
        }
        switch goal {
        case TypeOfGoal.loss.rawValue:
            return Int(caloriesOne * 0.85)
        case TypeOfGoal.gain.rawValue:
            return Int(caloriesOne * 1.1)
        default:
            return Int(caloriesOne)
        }
    }
}
