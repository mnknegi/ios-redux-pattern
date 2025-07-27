//
//  Store.swift
//  HelloRedux
//
//  Created by Mayank Negi on 27/07/25.
//

import Foundation

typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State

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

struct AddAction: Action {
    var value: Int
}

struct AddTaskAction: Action {
    let task: Task
}

class Store<StoreState: ReduxState>: ObservableObject {

    var reducer: Reducer<StoreState>
    @Published var state: StoreState

    init(state: StoreState, reducer: @escaping Reducer<StoreState>) {
        self.state = state
        self.reducer = reducer
    }

    func dispatch(_ action: Action) {
        self.state = reducer(state, action)
    }
}
