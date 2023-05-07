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
    @Published var badSignIn = false
    @Published var goodRegistration = false
    @AppStorage("auth") var authenticated = false {
            willSet { objectWillChange.send() }
        }
    
    func login(email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.badSignIn = true
            } else {
                self.badSignIn = false
                self.authenticated.toggle()
            }
        }
    }
    func registration(email: String, password: String, name: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                self.goodRegistration = true
                print("OK")
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: [
                    "firstname": name,
                    "email": email,
                    "id": result!.user.uid
                ])
            }
        }
    }

    func regAndSignIn(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password)
        Auth.auth().signIn(withEmail: email, password: password)
    }
}
