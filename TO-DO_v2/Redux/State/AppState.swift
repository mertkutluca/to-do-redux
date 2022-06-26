//
//  AppState.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 26.06.2022.
//

import ReSwift
import ReSwiftRouter

struct AppState: StateType {
    var todos: [ToDo] = [ToDo.dummy(id: 1), ToDo.dummy(id: 2), ToDo.dummy(id: 3), ToDo.dummy(id: 4), ToDo.dummy(id: 5), ToDo.dummy(id: 6), ToDo.dummy(id: 7), ToDo.dummy(id: 8), ToDo.dummy(id: 9)]
    var navigationState: NavigationState = NavigationState()
}
