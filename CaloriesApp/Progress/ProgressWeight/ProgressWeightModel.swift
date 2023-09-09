//
//  ProgressWeightModel.swift
//  CaloriesApp
//
//  Created by Данила on 03.09.2023.
//

import Foundation
import Firebase
import FirebaseFirestore


class ProgressWeightModel {

    func getStoredData(docId: String, completion: @escaping (String?, String?, String?, String?, String?) -> Void) {
        let db = Firestore.firestore()
        let docRef = db.collection("usersNew").document(docId)
        
        docRef.getDocument { (document, error) in
            if let error = error {
                print("Error getting document: \(error)")
                completion(nil, nil, nil, nil, nil)
            } else if let document = document, document.exists {
                if let maxWeight = document.data()?["Max"] as? String,
                   let minWeight = document.data()?["Min"] as? String,
                   let goalWeight = document.data()?["WeightGoal"] as? String,
                   let weightNow = document.data()?["WeightNow"] as? String,
                   let goal = document.data()?["GoalCalories"] as? String {
                    DispatchQueue.main.async {
                        completion(maxWeight, minWeight, goalWeight, weightNow, goal)
                    }
                } else {
                    print("Data is not in the expected format")
                    completion(nil, nil, nil, nil, nil)
                }
            } else {
                print("Document does not exist")
                completion(nil, nil, nil, nil, nil)
            }
        }
    }

}
