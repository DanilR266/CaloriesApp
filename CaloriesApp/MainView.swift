//
//  MainView.swift
//  CaloriesApp
//
//  Created by Данила on 26.04.2023.
//

import SwiftUI
import SlidingTabView
struct MainView: View {
    var body: some View {
                    
        TabView {
            MainScreen()
            ContentView()
        }
        .tabViewStyle(.page)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
