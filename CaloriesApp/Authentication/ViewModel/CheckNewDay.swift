//
//  CheckNewDay.swift
//  CaloriesApp
//
//  Created by Данила on 30.07.2023.
//

import Foundation
import SwiftUI

class CheckNewDay: ObservableObject {
    
    @AppStorage("day") var dayP = 1 {
        willSet { objectWillChange.send() }
    }
    @AppStorage("month") var monthP = 1 {
        willSet { objectWillChange.send() }
    }
    @AppStorage("year") var yearP = 2023 {
        willSet { objectWillChange.send() }
    }
    
    let dayComponent = Calendar.current.component(.day, from: Date())
    let monthComponent = Calendar.current.component(.month, from: Date())
    let yearComponent = Calendar.current.component(.year, from: Date())
    
    func check() -> Bool {
        if self.yearComponent > self.yearP || self.monthComponent > self.monthP || self.yearComponent > self.yearP {
            updateComponents()
            return false
        }
        updateComponents()
        return true
        
    }
    
    func updateComponents() {
        self.dayP = dayComponent
        self.monthP = monthComponent
        self.yearP = yearComponent
    }


}
