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
    @AppStorage("date") var date = "" {
        willSet { objectWillChange.send() }
    }
    @AppStorage("hourForToken") var tokenHour = "00"
    
    let dayComponent = Calendar.current.component(.day, from: Date())
    let monthComponent = Calendar.current.component(.month, from: Date())
    let yearComponent = Calendar.current.component(.year, from: Date())
    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }

    func check() -> Bool {
        let currentDate = Date()
        let formattedDate = formatDate(currentDate)
        if formattedDate != self.date {
            updateComponents()
            return false
        }
        updateComponents()
        return true
        
    }
    
    func checkHour() -> Bool {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        let formattedDate = dateFormatter.string(from: currentDate)
        if abs(Int(formattedDate)! - Int(tokenHour)!) >= 3 {
            self.tokenHour = formattedDate
            return true
        }
        self.tokenHour = formattedDate
        return false
    }
    
    func updateComponents() {
        let currentDate = Date()
        let formattedDate = formatDate(currentDate)
        self.date = formattedDate
    }


}
