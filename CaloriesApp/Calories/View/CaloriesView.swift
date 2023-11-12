//
//  CaloriesView.swift
//  CaloriesApp
//
//  Created by Данила on 29.06.2023.
//

import SwiftUI


struct MainCalories: View {
//    var keyboardResponder: KeyboardResponder
    @StateObject var shared = CaloriesViewModel()
    
    var body: some View {
        ZStack {
            CaloriesBackSide(amount: 3000, shared: shared).onAppear {
                shared.getStoredData()
            }
        }
    }
}

//struct CaloriesView_Previews: PreviewProvider {
//    static var previews: some View {
//        CaloriesView()
//    }
//}
