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
    var model = ProgressModel()
    
    func getFood() {
        model.getStoredData(docId: docId) { value, error in
            DispatchQueue.main.async {
                var i = 0
                while i < value!["calories"]!.count {
                    if value!["calories"]![i] != "" {
                        self.arrayFood.append(Food(name: value!["calories"]![i], size: value!["calories"]![i+1], kcal: value!["calories"]![i+2]))
                    }
                    i += 3
                }
            }
        }
    }
    
//    arrayFood = [Food(name: "Коктейль протеиновый", size: "100", kcal: "210"), Food(name: "Макароны", size: "200", kcal: "310")].self
}
