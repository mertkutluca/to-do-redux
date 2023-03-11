//
//  AppState.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 26.06.2022.
//

import SwiftRedux

enum AppNavigationState {
    case todo(subState: ToDoNavigationState)
    case profile
}

enum ToDoNavigationState: Int {
    case list = 0
    case detail = 1

    var navigationIndex: Int {
        return self.rawValue
    }
}

struct AppState: State {
    var todos: [ToDo] = []
    var navigationState: AppNavigationState = .todo(subState: .list)
}
