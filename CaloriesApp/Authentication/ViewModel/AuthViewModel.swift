//
//  AuthModel.swift
//  CaloriesApp
//
//  Created by Данила on 25.04.2023.
//

import Foundation
import Firebase
import FirebaseFirestore
import SwiftUI

class Authentication: ObservableObject {
    
    public init() { }
    @Published var userEmail: String = ""
    @Published var userPassword: String = ""
    @Published var regBool: Bool = false
    @Published private var isTextFieldFocused: Bool = false
    @Published var name: String = ""
    @Published var badSignIn = false
    @Published var goodRegistration = false
    @Published var errorRegistration: String? = ""
    @Published var errorAuth: String? = ""
    @Published var isLoading: Bool = false
    @Published var docIdNow: String = ""
    
    @AppStorage("CaloriesGoal") var caloriesGoal = 0 {
        willSet { objectWillChange.send() }
    }
    
    @Published var weightNow = 0.0
    
    @AppStorage("auth") var authenticated = false {
        willSet { objectWillChange.send() }
    }
    @AppStorage("name") var userName = "User" {
        willSet { objectWillChange.send() }
    }
    @AppStorage("id") var docId = "" {
        willSet { objectWillChange.send() }
    }

    
    func login() {
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { (result, error) in
            print(self.userEmail, self.userPassword)
            self.errorRegistration = error?.localizedDescription
            if error != nil {
                self.badSignIn = true
            } else {
                self.getDataAfterLogin()
                self.badSignIn = false
            }
        }
    }
    
    func getDataAfterLogin() {
        let db = Firestore.firestore()
        db.collection("usersNew").whereField("email", isEqualTo: userEmail)
            .getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    self.userName = document["firstname"] as? String ?? "User"
                    self.docId = document.documentID
                    self.authenticated.toggle()
                }
            }
        }
    }
    
    func registration(email: String, password: String, name: String) {
        self.isLoading = true
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                self.errorRegistration = error.localizedDescription
            }
            else {
                guard let _ = result else { return }
                let db = Firestore.firestore()
                db.collection("usersNew").addDocument(data: [
                    "email": email,
                    "firstname": name,
                    "uid": result!.user.uid,
                    "GoalCalories": "",
                    "Activity": "",
                    "Age": 0,
                    "Height": 0,
                    "WeightNow": "50",
                    "WeightGoal": "50",
                    "Sex": Sex.man.rawValue,
                    "CaloriesNow": 0
                ]).getDocument { res, arg  in
                    self.docIdNow = res?.documentID ?? ""
                    self.docId = self.docIdNow
                }
                self.isLoading = false
                self.goodRegistration = true
            }
        }
    }
    
    
//    func getStoredData() {
//        let db = Firestore.firestore()
//        let docRef = db.collection("usersNew").document(docId)
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                self.weightNow = Double(document.data()?["WeightNow"] as! String)!
//            } else {
//                print("Document does not exist")
//            }
//        }
//    }
    
    func signOut() {
        let firebaseAuth = Auth.auth()
        do {
          try
            firebaseAuth.signOut()
            authenticated.toggle()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
    // TEST
    func calorieCalculator(weight: String, height: Int, age: Int, sex: String, goal: String, activity: String) {
        var caloriesOne: Double = 0
        switch sex {
        case Sex.man.rawValue:
            let help1 = (13.397 * Double(weight)!)
            let help2 = (4.799 * Double(height)) - (5.677 * Double(age))
            caloriesOne = 88.362 + help1 + help2
        default:
            let help1 = (9.247 * Double(weight)!)
            let help2 = (3.098 * Double(height)) - (4.330 * Double(age))
            caloriesOne = 447.593 + help1 + help2
        }
        switch activity {
        case Activity.no.rawValue:
            caloriesOne *= 1.2
        case Activity.oneTwo.rawValue:
            caloriesOne *= 1.375
        case Activity.threeFive.rawValue:
            caloriesOne *= 1.55
        default:
            caloriesOne *= 1.725
        }
        switch goal {
        case TypeOfGoal.loss.rawValue:
            self.caloriesGoal = Int(caloriesOne * 0.85)
        case TypeOfGoal.gain.rawValue:
            self.caloriesGoal = Int(caloriesOne * 1.1)
        default:
            self.caloriesGoal = Int(caloriesOne)
        }
    }
    // TEST
    
    func setDataAfterRegistration(goalCal: String, activity: String, age: Int, height: Int, weightNow: String, weightGoal: String, sex: String) {
        let db = Firestore.firestore()
        db.collection("usersNew").document("\(docId)").updateData([
            "GoalCalories": goalCal,
            "Activity": activity,
            "Age": age,
            "Height": height,
            "WeightNow": weightNow == "" ? "50" : weightNow,
            "WeightGoal": weightGoal == "" ? "50" : weightGoal,
            "Sex": sex,
            "CaloriesNow": 0
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func setData(str: String) {
        let db = Firestore.firestore()
        print(docId, str)
        db.collection("usersNew").document("\(docId)").updateData([
            "wikis": str
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func updateCalories() {
        let db = Firestore.firestore()
        db.collection("usersNew").document("\(docId)").updateData([
            "CaloriesNow": 0
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
}
