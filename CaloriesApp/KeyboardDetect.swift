//
//  KeyboardDetect.swift
//  CaloriesApp
//
//  Created by Данила on 15.07.2023.
//

import Foundation
import SwiftUI


final class KeyboardResponder: ObservableObject {
    @Published private(set) var keyboardIsShowing: Bool = false
    @Published private(set) var keyboardHeight: CGFloat = 0
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            keyboardHeight = keyboardFrame.height
            withAnimation {
                keyboardIsShowing = true
            }
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        DispatchQueue.main.async {
            self.keyboardHeight = 0
            withAnimation {
                self.keyboardIsShowing = false
            }
        }
    }
}
