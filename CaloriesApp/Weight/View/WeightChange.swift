//
//  WeightChange.swift
//  CaloriesApp
//
//  Created by Данила on 05.11.2023.
//

import SwiftUI

struct WeightChange: View {
    @State var text: String = ""
    var body: some View {
        TextField("lls", text: $text)
            .foregroundColor(.blue)
    }
}

struct WeightChange_Previews: PreviewProvider {
    static var previews: some View {
        WeightChange()
    }
}
