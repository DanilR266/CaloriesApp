//
//  ProgressWeightViewModel.swift
//  CaloriesApp
//
//  Created by Данила on 31.07.2023.
//

import Foundation
import Firebase
import FirebaseFirestore
import SwiftUI

class ProgressWeightViewModel: ObservableObject {
    @AppStorage("id") var docId = ""
    @Published var weightNow = "0"
    @Published var maxWeight = "0"
    @Published var minWeight = "0"
    @Published var goalWeight = "0"
    @Published var goal = ""
    let modelProgressWeight = ProgressWeightModel()
    
    func weightRemainder() -> String {
        var num = 0.0
        switch goal {
        case "Похудение":
            let dif = Double(self.weightNow)! - Double(self.goalWeight)!
            dif > 0 ? (num = dif) : (num = 0)
        case "Набор":
            let dif = Double(self.goalWeight)! - Double(self.weightNow)!
            dif > 0 ? (num = dif) : (num = 0)
        default:
            num = abs(Double(self.goalWeight)! - Double(self.weightNow)!)
        }
        return String(format: "%.2f", num)
    }
    
    func getStoredData() {
        modelProgressWeight.getStoredData(docId: docId) { maxWeight, minWeight, goalWeight, weightNow, goal in
            self.maxWeight = maxWeight ?? "0"
            self.minWeight = minWeight ?? "0"
            self.goalWeight = goalWeight ?? "0"
            self.weightNow = weightNow ?? "0"
            self.goal = goal ?? "0"
        }
    }
    
}
