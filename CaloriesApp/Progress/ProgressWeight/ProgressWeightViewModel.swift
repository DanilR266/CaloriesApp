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
    @Published var bool = false
    @Published var arrayWeight: Array<(key: String, value: String)> = []
    @Published var convert: [Double] = []
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
    func convertData(data: Array<(key: String, value: String)>) -> [Double] {
        print(self.arrayWeight)
        return data.compactMap { (_, weightString) in
            return Double(weightString)
        }
    }
    
    func getStoredData() {
        modelProgressWeight.getStoredData(docId: docId) { weightArray in
//            self.arrayWeight = weightArray
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"

            let sortedPairs = weightArray.sorted { (pair1, pair2) in
                if let date1 = dateFormatter.date(from: pair1.key),
                   let date2 = dateFormatter.date(from: pair2.key) {
                    return date1 < date2
                } else {
                    return false
                }
            }
            self.bool = true
            self.arrayWeight = sortedPairs
            self.convert = sortedPairs.compactMap { (_, weightString) in
                return Double(weightString)
            }
        }
    }
}
