//
//  Store.swift
//  HelloRedux
//
//  Created by Mayank Negi on 27/07/25.
//

import Foundation

typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State
typealias Dispatcher = (Action) -> Void
typealias Middleware<StoreState: ReduxState> = (StoreState, Action, @escaping Dispatcher) -> Void

protocol ReduxState { }

struct AppState: ReduxState {
    var counterState = CounterState()
    var taskState = TaskState()
}

struct TaskState: ReduxState {
    var tasks: [Task] = []
}

struct CounterState: ReduxState {
    var counter: Int = 0
}

protocol Action { }

struct IncrementAction: Action { }
struct DecrementAction: Action { }

struct IncrementActionAsync: Action { }

struct AddAction: Action {
    var value: Int
}

struct AddTaskAction: Action {
    let task: Task
}

class Store<StoreState: ReduxState>: ObservableObject {

    var reducer: Reducer<StoreState>
    @Published var state: StoreState
    var middlewares: [Middleware<StoreState>]

    init(state: StoreState, reducer: @escaping Reducer<StoreState>, middlewares: [Middleware<StoreState>]) {
        self.state = state
        self.reducer = reducer
        self.middlewares = middlewares
    }

    func dispatch(_ action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }

        // run all middlewares
        middlewares.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
}
