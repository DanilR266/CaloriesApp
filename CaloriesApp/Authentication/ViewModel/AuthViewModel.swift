//
//  AuthViewModel.swift
//  CaloriesApp
//
//  Created by Данила on 22.04.2023.
//

import SwiftUI


class AuthViewModel {
    
    @ObservedObject var shared = Authentication()
    
    func loginFB(email: String, password: String) {
        shared.login(email: email, password: password)
    }
    func registrationFB(email: String, password: String, name: String) {
        shared.registration(email: email, password: password, name: name)
    }
    
    
}


extension Color {
    static var backgroundColor: Color { return Color(red: 220/255, green: 232/255, blue: 246/255) }
    static var buttonColor: Color { return Color(red: 101/255, green: 131/255, blue: 114/255) }
    static var waterButton: Color { return Color(red: 82/255, green: 205/255, blue: 243/255) }
    static var button2Color: Color { return Color(red: 19/255, green: 33/255, blue: 40/255) }
    static var fieldWeight: Color { return Color(red: 82/255, green: 80/255, blue: 213/255) }
    static var fieldCalories: Color { return Color(red: 66/255, green: 65/255, blue: 189/255) }
    static var fieldWater: Color { return Color(red: 47/255, green: 46/255, blue: 152/255) }
    static var plusButton: Color { return Color(red: 31/255, green: 190/255, blue: 245/255) }
}
