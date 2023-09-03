//
//  SettingsMain.swift
//  CaloriesApp
//
//  Created by Данила on 04.07.2023.
//

import SwiftUI

struct SettingsMain: View {
    @State var selectedTab = 1
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                CaloriesSettingsView().tabItem {
                    Text("Калории")
                }.tag(0)
                SettingsProfile().tabItem {
                    Text("Профиль")
                }.tag(1)
                Text("3").tabItem {
                    Text("Вес")
                }.tag(2)
            }
        }
    }
}

struct SettingsMain_Previews: PreviewProvider {
    static var previews: some View {
        SettingsMain()
    }
}
