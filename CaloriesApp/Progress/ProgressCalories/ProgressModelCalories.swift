//
//  ProgressModelCalories.swift
//  CaloriesApp
//
//  Created by Данила on 31.07.2023.
//

import Foundation


struct Food: Hashable {
    var name: String
    var size: String
    var kcal: String
}

let arrayFood = [Food(name: "Коктейль протеиновый", size: "100", kcal: "210"), Food(name: "Макароны", size: "200", kcal: "310")].self
