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
    @Published var lineWidth: CGFloat = 3
    @Published var fillCircle: Double = 1
    @Published var weightStore = "0"
    @Published var weightMin = "0"
    @Published var weightMax = "0"
    @Published var weightGoal = "0"
    
    @Published var waist = "0"
    
//    @ObservedObject var shared: Authentication

    @AppStorage("goal") var goalStore = "0" {
        willSet { objectWillChange.send() }
    }
    
    func buttonUpDown(plus: Bool, text: String, type: Int) -> String {
        if type == 0 {
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
        else {
            var number = (Float(text) ?? 0)
            if plus {
                number += 0.5
                weightGoal = String(Double(String(format: "%.2f", number))!)
                return String(format: "%.2f", number)
            }
            number -= 0.5
            weightGoal = String(Double(String(format: "%.2f", number))!)
            return number > 0 ? String(format: "%.2f", number) : "0"
        }
    }
    
    func percentNowGoal() -> Double {
        guard let doubleNow = Double(weightStore) else { return 0 }
        guard let doubleGoal = Double(weightGoal) else { return 0 }
        if doubleNow < doubleGoal {
            return doubleNow/doubleGoal
        }
        return doubleGoal/doubleNow
    }
    
    func getStoredData() {
        modelWeight.getStoredData(docId: docId) { weightStore, weightMin, weightMax, weightGoal in
            self.weightStore = weightStore ?? "0"
            self.weightMin = weightMin ?? "0"
            self.weightMax = weightMax ?? "0"
            self.weightGoal = weightGoal ?? "0"
            withAnimation(.linear(duration: 0.4)) {
                self.fillCircle = 0
                self.lineWidth = 8
                withAnimation(.linear(duration: 0.6).delay(0.5)) {
                    self.fillCircle = self.percentNowGoal()
                    self.lineWidth = 3
                }
            }
        }
    }
    
    private func setMinMax() {
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
            "WeightNow": weightStore,
            "WeightGoal": weightGoal
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
}
