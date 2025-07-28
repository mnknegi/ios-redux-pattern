//
//  MoviesAppApp.swift
//  MoviesApp
//
//  Created by Mayank Negi on 28/07/25.
//

import SwiftUI

@main
struct MoviesAppApp: App {
    var body: some Scene {

        let store = Store(state: AppState(), reducer: appReducer, middlewares: [])

        WindowGroup {
            ContentView()
        }
    }
}
