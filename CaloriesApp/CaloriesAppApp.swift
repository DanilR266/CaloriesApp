//
//  CaloriesAppApp.swift
//  CaloriesApp
//
//  Created by Данила on 20.04.2023.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct CaloriesAppApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var auth = Authentication()
    @StateObject var checkDay = CheckNewDay()
    var body: some Scene {
        WindowGroup {
//                AuthViewMain(viewModel: auth)
            if !auth.authenticated {
                AuthViewMain(viewModel: auth).preferredColorScheme(.light)
            } else {
                MainScreenTabView(authModel: auth).preferredColorScheme(.light)
                    .onAppear {
                        if !checkDay.check() {
                            auth.updateCalories()
                        }
                        CurlRequest().getOauthToken()
                        
//                            if checkDay.checkHour() {
//                                CurlRequest().getOauthToken()
//                            }
                    }
            }
        }
    }
}
