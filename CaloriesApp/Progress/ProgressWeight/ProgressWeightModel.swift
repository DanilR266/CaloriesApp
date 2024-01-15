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

    func getStoredData(docId: String, completion: @escaping ([String:String]) -> Void) {
        let db = Firestore.firestore()
        let docRef = db.collection("Main").document(docId)
        docRef.getDocument { (document, error) in
            if let error = error {
                print("Error getting document: \(error)")
                completion([:])
            } else if let document = document, document.exists {
                if let weightArray = document.data()?["WeightDate"] as? [String:String] {
                    DispatchQueue.main.async {
                        completion(weightArray)
                    }
                } else {
                    print("Data is not in the expected format")
                    completion([:])
                }
            } else {
                print("Document does not exist")
                completion([:])
            }
        }
    }

}
