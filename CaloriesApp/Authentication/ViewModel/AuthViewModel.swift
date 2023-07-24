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
            self.errorRegistration = error?.localizedDescription
            if error != nil {
                self.badSignIn = true
            } else {
                self.getData()
                self.badSignIn = false
                self.authenticated.toggle()
            }
        }
    }
    
    func registration(email: String, password: String, name: String) {
        self.isLoading = true
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            self.isLoading = false
            self.goodRegistration = true
            self.errorRegistration = error?.localizedDescription
            guard let _ = result else { return }
            let db = Firestore.firestore()
            db.collection("users").addDocument(data: [
                "email": email,
                "firstname": name,
                "uid": result!.user.uid,
                "GoalCalories": "",
                "Activity": "",
                "Age": 0,
                "Height": 0,
                "WeightNow": "",
                "WeightGoal": ""
            ]).getDocument { res, arg  in
                self.docIdNow = res?.documentID ?? ""
            }
        }
    }
    
    func getData() {
        let db = Firestore.firestore()
        db.collection("users").whereField("email", isEqualTo: userEmail)
            .getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    self.userName = document["firstname"] as? String ?? "User"
                    self.docId = self.docIdNow
                }
            }
        }
    }
    
    
    func getStoredData() {
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(docId)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                print("Document data:", document.data()!["email"]!)
            } else {
                print("Document does not exist")
            }
        }
    }
    
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
    
    func setDataAfterRegistration(goalCal: String, activity: String, age: Int, height: Int, weightNow: String, weightGoal: String) {
        let db = Firestore.firestore()
        db.collection("users").document("\(docIdNow)").updateData([
            "GoalCalories": goalCal,
            "Activity": activity,
            "Age": age,
            "Height": height,
            "WeightNow": weightNow == "" ? "50" : weightNow,
            "WeightGoal": weightGoal == "" ? "50" : weightGoal
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
        db.collection("users").document("\(docId)").updateData([
            "wikis": str
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
}
