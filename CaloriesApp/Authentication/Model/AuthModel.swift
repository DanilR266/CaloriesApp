//AuthModel.swift
//CaloriesApp
//Created by Данила on 25.04.2023.


import Foundation

class AuthModel {
    
}

enum StoredData: String {
    case Activity, Age, Height, GoalCalories, WeightNow, WeightGoal
}

public struct StoredDataStruct {
    var activity: String = Activity.no.rawValue
    var age: Int = 20
    var height: Int = 170
    var goalCalories: String = TypeOfGoal.loss.rawValue
    var weightNow: String = "50"
    var weightGoal: String = "50"
}
