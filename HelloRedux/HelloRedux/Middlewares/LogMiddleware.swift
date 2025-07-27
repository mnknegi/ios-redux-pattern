//
//  LogMiddleware.swift
//  HelloRedux
//
//  Created by Mayank Negi on 27/07/25.
//

import Foundation

func logMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        print("[Log Middleware]")
    }
}
