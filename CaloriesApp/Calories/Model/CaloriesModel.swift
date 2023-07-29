//
//  CaloriesModel.swift
//  CaloriesApp
//
//  Created by Данила on 29.06.2023.
//

import Foundation
import SwiftUI

class modelCalories: ObservableObject {
    
}

enum TypeOfGoal: String {
    case loss = "Похудение"
    case gain = "Набор"
    case support = "Поддержка"
}

enum Activity: String {
    case no = "Нет физической нагрузки"
    case oneTwo = "Физическая нагрузка 1-2 раза в неделю"
    case threeFive = "Физическая нагрузка 3-5 раза в неделю"
    case moreFive = "Физическая нагрузка больше 5 раз в неделю"
}

enum Sex: String {
    case man = "Мужчина"
    case woman = "Женщина"
}


