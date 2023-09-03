//
//  SettingsViewModel.swift
//  CaloriesApp
//
//  Created by Данила on 31.07.2023.
//

import Foundation
import Firebase
import FirebaseFirestore
import SwiftUI

class SettingsViewModel: ObservableObject {
    @AppStorage("name") var userName = "User"
    @AppStorage("id") var docId = ""
    @AppStorage("auth") var authenticated = true
    
    func updateName(name: String, docId: String) {
        FirebaseService.shared.updateUserName(docId: docId, newName: name) { error in
            if let error = error {
                print("Error updating name: \(error)")
            } else {
                print("Name updated successfully!")
            }
        }
    }
    func signOut() {
        FirebaseService.shared.signOut(authenticated: &authenticated)
    }
}
