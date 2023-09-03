//
//  ModelWeight.swift
//  CaloriesApp
//
//  Created by Данила on 07.06.2023.
//

import Foundation
import Firebase
import FirebaseFirestore
import SwiftUI

class WeightViewModel: ObservableObject {
    
    let modelWeight = ModelWeight()
    
    @AppStorage("id") var docId = ""
    
    @Published var weightStore = "Load..."
    @Published var weightMin = "0"
    @Published var weightMax = "0"
    
//    @ObservedObject var shared: Authentication

    @AppStorage("goal") var goalStore = "50" {
        willSet { objectWillChange.send() }
    }
    
    func getWeigth() -> String {
        return String(self.weightStore)
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
            weightStore = String(Double(String(format: "%.2f", number))!)
            return String(format: "%.2f", number)
        }
        number -= 0.05
        weightStore = String(Double(String(format: "%.2f", number))!)
        return number > 0 ? String(format: "%.2f", number) : "0"
    }
    
    func updateData(str: String, goal: String) {
        weightStore = String(Double(str)!)
        goalStore = goal
    }
    
    
    func getStoredData() {
        modelWeight.getStoredData(docId: docId) { weightStore, weightMin, weightMax in
            self.weightStore = weightStore ?? "0"
            self.weightMin = weightMin ?? "0"
            self.weightMax = weightMax ?? "0"
        }
    }
    
    private func setMinMax() {
        print(self.weightMax, self.weightMin, self.weightStore)
        let db = Firestore.firestore()
        if self.weightMax < self.weightStore {
            self.weightMax = self.weightStore
            db.collection("usersNew").document("\(docId)").updateData([
                "Max": self.weightStore
            ])
        }
        if self.weightMin > self.weightStore {
            self.weightMin = self.weightStore
            db.collection("usersNew").document("\(docId)").updateData([
                "Min": self.weightStore
            ])
        }
    }
    
    func setData(str: String) {
        setMinMax()
        let db = Firestore.firestore()
        db.collection("usersNew").document("\(docId)").updateData([
            "WeightNow": str,
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print(str)
                print("Document successfully written!")
            }
        }
    }
    
}
