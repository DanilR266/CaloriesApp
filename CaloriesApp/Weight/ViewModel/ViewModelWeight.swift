//
//  ModelWeight.swift
//  CaloriesApp
//
//  Created by Данила on 07.06.2023.
//

import Foundation
import Foundation
import Firebase
import FirebaseFirestore
import SwiftUI

class WeightViewModel: ObservableObject {
    
    @AppStorage("weight") var weightStore = 55.0 {
        willSet { objectWillChange.send() }
    }

    @AppStorage("goal") var goalStore = "50" {
        willSet { objectWillChange.send() }
    }
    
    func getWeigth() -> String {
        return String(weightStore)
    }
    func getGoal() -> String {
        return goalStore
    }
    
    func textForDif(weight: String, goal: String) -> String {
        let dif = abs((Double(weight) ?? 0) - (Double(goal) ?? 0))
        return dif <= 0 ? "0" : String(format: "%.1f", dif)
    }
    func goodSize(text: String) -> CGFloat {
        return text.count <= 4 ? 30 : 24
    }
    func buttonUpDown(plus: Bool, text: String) -> String {
        var number = (Float(text) ?? 0)
        if plus {
            number += 0.05
            weightStore = Double(String(format: "%.2f", number))!
            return String(format: "%.2f", number)
        }
        number -= 0.05
        weightStore = Double(String(format: "%.2f", number))!
        return number > 0 ? String(format: "%.2f", number) : "0"
    }
    
    func updateData(weight: String, goal: String) {
        weightStore = Double(weight)!
        goalStore = goal
    }
}
