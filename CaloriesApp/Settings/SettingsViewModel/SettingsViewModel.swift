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
    @Published var name = ""
    @Published var goalCalories = ""
    @Published var goalWeight = ""
    let modelSettings = ModelSettings()
    
    func getStored() {
        modelSettings.getStoredData(docId: docId) { weight, name, calories in
            self.goalCalories = String(calories ?? 0)
            self.goalWeight = weight ?? "0"
            self.name = name ?? "User"
        }
    }
    
    func setData() {
        modelSettings.setData(calories: Int(self.goalCalories) ?? 1500, name: self.name, weight: self.goalWeight, docId: self.docId)
    }
    
    func signOut() {
        modelSettings.signOut(authenticated: &authenticated)
    }
}
