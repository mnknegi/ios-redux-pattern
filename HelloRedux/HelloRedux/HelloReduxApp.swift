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

        let store = Store<AppState>(state: AppState(),
                          reducer: appReducer,
                          middlewares: [logMiddleware()])

        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
