//
//  TaskReducer.swift
//  HelloRedux
//
//  Created by Mayank Negi on 27/07/25.
//

import Foundation

func TaskReducer(_ state: TaskState, _ action: Action) -> TaskState {
    var mutableState = state
    switch action {
    case let action as AddTaskAction:
        mutableState.tasks.append(action.task)
    default:
        break
    }
    return mutableState
}
