//
//  ToDoReducer.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 26.06.2022.
//

import ReSwift
import ReSwiftRouter

func AppReducer(action: Action, state: AppState?) -> AppState {
    let initialToDosForTest: [ToDo] = [ToDo.dummy(id: 1), ToDo.dummy(id: 2), ToDo.dummy(id: 3), ToDo.dummy(id: 4), ToDo.dummy(id: 5), ToDo.dummy(id: 6), ToDo.dummy(id: 7), ToDo.dummy(id: 8), ToDo.dummy(id: 9)]
    return AppState(
        todos: toDoReducer(action: action, todos: state?.todos ?? initialToDosForTest),
        navigationState: NavigationReducer.handleAction(action, state: state?.navigationState)
    )
}

func toDoReducer(action: Action, todos: [ToDo]?) -> [ToDo] {
    var _todos = todos ?? []

    switch action {
    case let addAction as AddToDoAction:
        _todos.append(addAction.toDoToAdd)
    case let removeAction as RemoveToDoAction:
        _todos.removeAll(where: {
            $0.title == removeAction.title
        })
    case _ as UpdateToDoAction:
        fatalError()
    default:
        break
    }

    return _todos
}
