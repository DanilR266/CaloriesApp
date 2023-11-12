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

class ModelWeight: ObservableObject {
    
    func getStoredData(docId: String, completion: @escaping (String?, String?, String?, String?) -> Void) {
        let db = Firestore.firestore()
        let docRef = db.collection("usersNew").document(docId)
        
        docRef.getDocument { (document, error) in
            if let error = error {
                print("Error getting document: \(error)")
                completion(nil, nil, nil, nil)
            } else if let document = document, document.exists {
                if let weightNow = document.data()?["WeightNow"] as? String,
                   let weightMin = document.data()?["Min"] as? String,
                   let weightMax = document.data()?["Max"] as? String,
                   let weightGoal = document.data()?["WeightGoal"] as? String {
                    DispatchQueue.main.async {
                        completion(weightNow, weightMin, weightMax, weightGoal)
                    }
                } else {
                    print("Data is not in the expected format")
                    completion(nil, nil, nil, nil)
                }
            } else {
                print("Document does not exist")
                completion(nil, nil, nil, nil)
            }
        }
    }
    
}
