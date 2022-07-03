//
//  AppState.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 26.06.2022.
//

import ReSwift
import ReSwiftRouter

struct AppState: StateType {
    var todos: [ToDo] = []
    var navigationState: NavigationState = NavigationState()
}
