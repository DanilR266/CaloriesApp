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
    func swipeToGoBack() -> some View {
        self.modifier(SwipeToGoBackModifier())
    }
}


struct SwipeToGoBackModifier: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture(minimumDistance: 20, coordinateSpace: .global)
                    .onChanged { value in
                        guard value.startLocation.x < 20, value.translation.width > 45 else { return }
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }
            )
    }
}
