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
    @ObservedObject var auth = Authentication()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if !auth.authenticated {
                    AuthView()
                } else { MainScreen() }
            }
        }
    }
}
