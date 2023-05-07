
//
//  ContentView.swift
//  CaloriesApp
//
//  Created by Данила on 20.04.2023.
//

import SwiftUI
import Firebase



struct ContentView: View {
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, bgfr!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
