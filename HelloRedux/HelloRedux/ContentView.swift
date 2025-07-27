//
//  ContentView.swift
//  HelloRedux
//
//  Created by Mayank Negi on 27/07/25.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var store: Store<AppState>

    @State private var isPresented: Bool = false

    struct Props {
        let counter: Int
        let onIncrement: () -> Void
        let onDecrement: () -> Void
        let addAction: () -> Void
    }

    private func map(state: CounterState) -> Props {
        Props(counter: state.counter) {
            store.dispatch(IncrementAction())
        } onDecrement: {
            store.dispatch(DecrementAction())
        } addAction: {
            store.dispatch(AddAction(value: 5))
        }
    }

    var body: some View {

        let props = map(state: store.state.counterState)

        VStack {
            Text("\(props.counter)")
                .padding()

            VStack(spacing: 20) {
                HStack(spacing: 60) {
                    Button {
                        props.onIncrement()
                    } label: {
                        Text("Increment")
                    }
                    
                    Button {
                        props.onDecrement()
                    } label: {
                        Text("Decrement")
                    }
                }

                Button {
                    props.addAction()
                } label: {
                    Text("Add 5")
                }

                Button {
                    isPresented = true
                } label: {
                    Text("Add Task")
                }
            }
        }
        .sheet(isPresented: $isPresented) {
            AddTaskView()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Store(state: AppState(), reducer: appReducer))
}
