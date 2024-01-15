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
    @AppStorage("CaloriesGoal") var caloriesGoal = 1000 {
        willSet { objectWillChange.send() }
    }
    @AppStorage("id") var docId = ""
    
    @Published var arrayMyFood: Array<Food> = []
    @Published var calForView: Int = 0
    @Published var lineWidth: CGFloat = 3
    @Published var fillCircle: Double = 1
    @Published var ccal = "0"
    @Published var prot = "0"
    @Published var fat = "0"
    @Published var chocdf = "0"
    @Published var nameFood = "Блюдо"
    
    @Published var selectedButton: String = TypeOfGoal.loss.rawValue
    @Published var selectedActivity: String = Activity.no.rawValue
    @Published var age: Int = 1
    @Published var height: Int = 170
    
    @State var selected = 1


    
    func getNutrients(texts: [String], size: String) {
        translate.translateText(texts: texts) { result in
            switch result {
            case .success(let translations):
                self.foodRequest.fetchFoodData(ingredient: translations[0]) { value in
                    DispatchQueue.main.async {
                        let calSize = (Double(size) ?? 0)/100
                        self.ccal = String(Int(Double(value?.enercKcal ?? 0)*calSize))
                        self.prot = String(Int(Double(value?.procnt ?? 0)*calSize))
                        self.fat = String(Int(Double(value?.fat ?? 0)*calSize))
                        self.chocdf = String(Int(Double(value?.chocdf ?? 0)*calSize))
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
        self.setData(number: self.calories)
    }
    
    func fastCahngeCalories(fastChange: Int) {
        self.calories = self.calories + fastChange >= 0  ? self.calories + fastChange : self.calories
        withAnimation() {
            self.fillCircle = 1 - self.percentNowGoal()
        }
        self.setData(number: self.calories)
    }
    
    func getStoredData() {
        modelCalories.getStoredData(docId: docId) { calories, goal, error in
            self.calories = calories ?? 0
            self.caloriesGoal = goal ?? 1500
            withAnimation(.linear(duration: 0.4)) {
                self.fillCircle = 0
                self.lineWidth = 8
                withAnimation(.linear(duration: 0.6).delay(0.5)) {
                    self.fillCircle = 1 - self.percentNowGoal()
                    self.lineWidth = 3
                }
            }
        }
    }
    func testDate() {
        modelCalories.testDate(docId: docId, num: 5)
    }
    
    private func percentNowGoal() -> Double {
        return Double((self.caloriesGoal - self.calories)) / Double(self.caloriesGoal)
    }
    
    func setFood(food: Array<String>) {
        modelCalories.setFood(docId: docId, food: food)
    }
    func setMyFood(food: Array<String>) {
        modelCalories.setMyFood(docId: docId, food: food)
    }
    
    func setData(number: Int) {
        modelCalories.setData(number: number, docId: docId)
    }
    func cleanMyFood() {
        modelCalories.cleanMyFood(docId: docId)
        arrayMyFood = []
    }
    func getMyFood() {
        modelCalories.getMyFood(docId: docId) { value, error in
            DispatchQueue.main.async {
                var i = 0
                while i < value?.count ?? 0 {
                    if value![i] != "" {
                        self.arrayMyFood.append(Food(name: value![i], size: value![i+1], kcal: value![i+2]))
                    }
                    i += 3
                }
            }
        }
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
