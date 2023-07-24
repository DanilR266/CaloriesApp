//
//  WaterViewModel.swift
//  CaloriesApp
//
//  Created by Данила on 19.07.2023.
//

import Foundation
import SwiftUI

class WaterViewModel: ObservableObject {
    @AppStorage("water") var water: Int = 0 {
        willSet { objectWillChange.send() }
    }
}
