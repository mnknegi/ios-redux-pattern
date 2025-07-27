//
//  AddTaskView.swift
//  HelloRedux
//
//  Created by Mayank Negi on 27/07/25.
//

import SwiftUI

struct AddTaskView: View {

    @EnvironmentObject var store: Store<AppState>

    @State private var name: String = ""

    struct Props {
        let tasks: [Task]
        let onTaskAdded: (Task) -> Void
    }

    private func map(state: TaskState) -> Props {
        return Props(tasks: state.tasks) { task in
            store.dispatch(AddTaskAction(task: task))
        }
    }

    var body: some View {

        let props = map(state: store.state.taskState)

        VStack {
            TextField("Enter Task", text: $name)
                .textFieldStyle(.roundedBorder)

            Button {
                let task = Task(title: name)
                props.onTaskAdded(task)
            } label: {
                Text("Add")
            }

            List(props.tasks) { task in
                Text(task.title)
            }

        }
        .padding()
    }
}

#Preview {
    AddTaskView()
        .environmentObject(Store(state: AppState(), reducer: appReducer))
}
