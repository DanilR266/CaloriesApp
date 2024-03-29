//
//  AuthViewMain.swift
//  CaloriesApp
//
//  Created by Данила on 24.07.2023.
//

import SwiftUI

struct AuthViewMain: View {
    @ObservedObject var viewModel: Authentication
    var body: some View {
        if viewModel.goodRegistration {
            MainScreenTabView(authModel: viewModel)
        }
        else {
            AuthView(viewModel: viewModel)
        }
    }
}

struct AuthViewMain_Previews: PreviewProvider {
    static var previews: some View {
        AuthViewMain(viewModel: Authentication())
    }
}


