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
    
    @AppStorage("id") var docId = ""
    
    @Published var weightStore = "Load..."
    
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
        let db = Firestore.firestore()
        let docRef = db.collection("usersNew").document(docId)
        docRef.getDocument { (document, error) in
            let currentThread2 = Thread.current
            if let threadName = currentThread2.name {
                print("Текущий поток2: \(threadName)")
            } else {
                print("Текущий поток2: безымянный")
            }

            if let document = document, document.exists {
                DispatchQueue.main.async {
                    self.weightStore = String(Double(document.data()?["WeightNow"] as! String)!)
                }
            } else {
                print("Document does not exist")
            }
        }
    }
    
    func setData(str: String) {
        let db = Firestore.firestore()
        db.collection("usersNew").document("\(docId)").updateData([
            "WeightNow": str
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
}
