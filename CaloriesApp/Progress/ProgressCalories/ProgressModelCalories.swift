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
                while i < value?.count ?? 0 {
                    if value![i] != "" {
                        self.arrayFood.append(Food(name: value![i], size: value![i+1], kcal: value![i+2]))
                    }
                    i += 3
                }
            }
        }
    }
}
