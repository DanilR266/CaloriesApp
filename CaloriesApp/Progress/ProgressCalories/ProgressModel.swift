//
//  ProgressModel.swift
//  CaloriesApp
//
//  Created by Данила on 30.07.2023.
//

import Foundation
import Firebase
import FirebaseFirestore
import SwiftUI

class ProgressModel: ObservableObject {
    
    
    func getStoredData(docId: String, date: Date, completion: @escaping ([String]?, Error?) -> Void) {
        let db = Firestore.firestore()
        let docRef = db.collection("usersNew").document(docId)
        
        docRef.getDocument { (document, error) in
            if let error = error {
                completion(nil, error)
            } else if let document = document, document.exists {
                if let food = document.data()?["FoodDate"] as? [String: [String]] {
                    DispatchQueue.main.async {
                        completion(food[self.dateToString(date: date)], nil)
                    }
                } else {
                    completion(nil, nil) // or handle the absence of "CaloriesNow" as needed
                }
            } else {
                print("Document does not exist")
            }
        }
    }
    func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        let currentDate = date
        let dateString = dateFormatter.string(from: currentDate)
        
        return dateString
    }
}


enum GraphPeriod: String {
    case week = "Неделя"
    case month = "Месяц"
    case year = "Год"
}

enum SelectedView: String {
    case weightView = "Вес"
    case caloriesView = "Калории"
    case waterView = "Вода"
}

struct Food: Hashable {
    var name: String
    var size: String
    var kcal: String
    var id = UUID()
}
