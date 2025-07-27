//
//  CounterReducer.swift
//  HelloRedux
//
//  Created by Mayank Negi on 27/07/25.
//

import Foundation

func counterReducer(_ state: CounterState, _ action: Action) -> CounterState {
    var mutableState = state
    switch action {
    case _ as IncrementAction:
        mutableState.counter += 1
    case _ as DecrementAction:
        mutableState.counter -= 1
    case let action as AddAction:
        mutableState.counter += action.value
    default:
        break
    }
    return mutableState
}
