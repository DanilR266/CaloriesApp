//
//  CaloriesModel.swift
//  CaloriesApp
//
//  Created by Данила on 29.06.2023.
//

import Foundation
import Firebase
import FirebaseFirestore
import SwiftUI

class ModelCalories: ObservableObject {
    
    func getStoredData(docId: String, completion: @escaping (Int?, Int?, Error?) -> Void) {
        let db = Firestore.firestore()
        let docRef = db.collection("usersNew").document(docId)
        
        docRef.getDocument { (document, error) in
            if let error = error {
                completion(nil, nil, error)
            } else if let document = document, document.exists {
                if let calories = document.data()?["CaloriesNow"] as? Int,
                   let goal = document.data()?["GoalCalories"] as? Int {
                    DispatchQueue.main.async {
                        completion(calories, goal, nil)
                    }
                } else {
                    completion(nil, nil, nil) // or handle the absence of "CaloriesNow" as needed
                }
            } else {
                print("Document does not exist")
            }
        }
    }
    func setData(number: Int, docId: String) {
        let db = Firestore.firestore()
        db.collection("usersNew").document("\(docId)").updateData([
            "CaloriesNow": number
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func setFood(docId: String, food: Array<String>) {
        let db = Firestore.firestore()
        let docRef = db.collection("usersNew").document(docId)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if var foodArray = document.data()?["Food"] as? [String] {
                    foodArray.append(contentsOf: food)
                    db.collection("usersNew").document("\(docId)").updateData([
                        "Food": foodArray
                    ])
                }
            }
        }
    }
    func setMyFood(docId: String, food: Array<String>) {
        let db = Firestore.firestore()
        let docRef = db.collection("usersNew").document(docId)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if var foodArray = document.data()?["SavedFood"] as? [String] {
                    foodArray.append(contentsOf: food)
                    db.collection("usersNew").document("\(docId)").updateData([
                        "SavedFood": foodArray
                    ])
                }
            }
        }
    }
    
    func cleanMyFood(docId: String) {
        let db = Firestore.firestore()
        db.collection("usersNew").document("\(docId)").updateData([
            "SavedFood": []
        ])
    }
    
    func getMyFood(docId: String, completion: @escaping ([String]?, Error?) -> Void) {
        let db = Firestore.firestore()
        let docRef = db.collection("usersNew").document(docId)
        
        docRef.getDocument { (document, error) in
            if let error = error {
                completion(nil, error)
            } else if let document = document, document.exists {
                if let food = document.data()?["SavedFood"] as? [String] {
                    DispatchQueue.main.async {
                        completion(food, nil)
                    }
                } else {
                    completion(nil, nil) // or handle the absence of "CaloriesNow" as needed
                }
            } else {
                print("Document does not exist")
            }
        }
    }
    
}

enum TypeOfGoal: String {
    case loss = "Похудение"
    case gain = "Набор"
    case support = "Поддержка"
}

enum Activity: String {
    case no = "Нет физической нагрузки"
    case oneTwo = "Физическая нагрузка 1-2 раза в неделю"
    case threeFive = "Физическая нагрузка 3-5 раза в неделю"
    case moreFive = "Физическая нагрузка больше 5 раз в неделю"
}

enum Sex: String {
    case man = "Мужчина"
    case woman = "Женщина"
}


