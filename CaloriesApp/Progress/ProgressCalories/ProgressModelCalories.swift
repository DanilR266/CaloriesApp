//
//  ProgressModelCalories.swift
//  CaloriesApp
//
//  Created by Данила on 31.07.2023.
//

import Foundation
import SwiftUI

class ProgressViewModel: ObservableObject {
    @AppStorage("id") var docId = ""
    @Published var arrayFood: Array<Food> = []
    @Published var startccal: Int = 0
    @Published var selectedDate: Date = Date() {
        willSet(newVaule) {
            print(newVaule)
            getFood(date: newVaule)
        }
    }
    @AppStorage("CaloriesGoal") var caloriesGoal = 1000 {
        willSet { objectWillChange.send() }
    }
    var model = ProgressModel()
    
    func getFood(date: Date) {
        startccal = 0
        arrayFood = []
        model.getStoredData(docId: docId, date: date) { value, error in
            DispatchQueue.main.async {
                var i = 0
                while i < value?.count ?? 0 {
                    if value![i] != "" {
                        self.arrayFood.append(Food(name: value![i], size: value![i+1], kcal: value![i+2]))
                        self.startccal += Int(value![i+2]) ?? 0
                    }
                    i += 3
                }
            }
        }
    }
    func widthSecond() -> Int {
        let size = Int((startccal * 340) / caloriesGoal)
        if size >= 340 {
            return 340
        }
        return size
    }
}
