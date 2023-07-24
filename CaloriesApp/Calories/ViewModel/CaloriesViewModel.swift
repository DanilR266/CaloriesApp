//
//  CaloriesViewModel.swift
//  CaloriesApp
//
//  Created by Данила on 29.06.2023.
//

import Foundation
import SwiftUI

class CaloriesViewModel: ObservableObject {
    var fireStore = Authentication()
    @AppStorage("calories") var calories: Int = 0 {
        willSet { objectWillChange.send() }
    }
    @Published var calForView: Int = 0
    
    @Published var backDegree = 0.0
    @Published var frontDegree = -90.0
    @Published var isFlipped = false
    
    @Published var selectedButton: String = TypeOfGoal.loss.rawValue
    @Published var selectedActivity: String = Activity.no.rawValue
    @Published var age: Int = 1
    @Published var height: Int = 170
    
    let durationAndDelay : CGFloat = 0.15
    
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
    
    func amountBar(amount: Int, max: Int) -> Int {
        return amount * 300 / max
    }
    
    func addCalories(calorie: Int) {
        self.calories = calorie
        self.calForView = calorie
    }
    
    func fastCahngeCalories(fastChange: Int) {
        self.calories = self.calories + fastChange >= 0  ? self.calories + fastChange : self.calories
    }
    
    func setCal(str: String) {
        fireStore.setData(str: str)
    }
    func getStored() {
        fireStore.getStoredData()
    }
    
}
