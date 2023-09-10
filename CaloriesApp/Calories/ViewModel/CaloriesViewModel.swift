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
    let foodRequest = RequestFood()
    let translate = CurlRequest()
    @AppStorage("calories") var calories: Int = 0 {
        willSet { objectWillChange.send() }
    }
    @AppStorage("CaloriesGoal") var caloriesGoal = 0 {
        willSet { objectWillChange.send() }
    }
    @AppStorage("id") var docId = ""
    
    @Published var calForView: Int = 0
    
    @Published var ccal = "0"
    @Published var prot = "0"
    @Published var fat = "0"
    @Published var chocdf = "0"
    @Published var nameFood = "Блюдо"
    
    @Published var selectedButton: String = TypeOfGoal.loss.rawValue
    @Published var selectedActivity: String = Activity.no.rawValue
    @Published var age: Int = 1
    @Published var height: Int = 170


    
    func getNutrients(texts: [String]) {
        translate.translateText(texts: texts) { result in
            switch result {
            case .success(let translations):
                self.foodRequest.fetchFoodData(ingredient: translations[0]) { value in
                    DispatchQueue.main.async {
                        self.ccal = String(value?.enercKcal ?? 0)
                        self.prot = String(value?.procnt ?? 0)
                        self.fat = String(value?.fat ?? 0)
                        self.chocdf = String(value?.chocdf ?? 0)
                        self.nameFood = texts[0]
                    }
                }
            case .failure(let error):
                print("Ошибка:", error)
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
    
    func setFood(food: Array<String>) {
        modelCalories.setFood(docId: docId, food: food)
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
