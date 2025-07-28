//
//  Store.swift
//  MoviesApp
//
//  Created by Mayank Negi on 28/07/25.
//

import Foundation

typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State
typealias Dispatcher = (Action) -> Void
typealias Middleware<StoreState: ReduxState> = (StoreState, Action, Dispatcher) -> Void

protocol ReduxState { }

protocol Action { }

struct AppState: ReduxState {

}

class Store<StoreState: ReduxState>: ObservableObject {

    var reducer: Reducer<StoreState>
    @Published var state: StoreState
    var middlewares: [Middleware<StoreState>]

    init(state: StoreState,
         reducer: @escaping Reducer<StoreState>,
         middlewares: [Middleware<StoreState>]) {
        self.state = state
        self.reducer = reducer
        self.middlewares = middlewares
    }

    func dispatch(_ action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }

        self.middlewares.forEach { middleware in
            middleware(self.state, action, dispatch)
        }
    }
}
