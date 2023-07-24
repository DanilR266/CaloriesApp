//
//  View+Extension.swift
//  CaloriesApp
//
//  Created by Данила on 17.07.2023.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
