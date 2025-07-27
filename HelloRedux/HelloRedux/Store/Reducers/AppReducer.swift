//
//  AppReducer.swift
//  HelloRedux
//
//  Created by Mayank Negi on 27/07/25.
//

import Foundation

func appReducer(_ state: AppState, _ action: Action) -> AppState {
    var mutableState = state
    mutableState.counterState = counterReducer(state.counterState, action)
    mutableState.taskState = TaskReducer(state.taskState, action)
    return mutableState
}
