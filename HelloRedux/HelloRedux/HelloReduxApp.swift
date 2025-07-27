//
//  HelloReduxApp.swift
//  HelloRedux
//
//  Created by Mayank Negi on 27/07/25.
//

import SwiftUI

@main
struct HelloReduxApp: App {
    var body: some Scene {

        let store = Store(state: AppState(), reducer: appReducer)

        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
