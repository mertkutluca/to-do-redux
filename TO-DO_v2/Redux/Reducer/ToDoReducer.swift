//
//  ToDoReducer.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 26.06.2022.
//

import ReSwift

fileprivate let initialToDosForTest: [ToDo] = [
    ToDo.dummy(index: 1),
    ToDo.dummy(index: 2),
    ToDo.dummy(index: 3),
    ToDo.dummy(index: 4),
    ToDo.dummy(index: 5),
    ToDo.dummy(index: 6),
    ToDo.dummy(index: 7),
    ToDo.dummy(index: 8),
    ToDo.dummy(index: 9)
]

func AppReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
        todos: toDoReducer(action: action, todos: state?.todos ?? initialToDosForTest)
//        navigationState: NavigationReducer.handleAction(action, state: state?.navigationState)
    )
}

func toDoReducer(action: Action, todos: [ToDo]?) -> [ToDo] {
    var _todos = todos ?? []

    switch action {
    case let addAction as AddToDoAction:
        _todos.append(addAction.toDoToAdd)
    case let removeAction as RemoveToDoAction:
        _todos.removeAll(where: {
            $0.id == removeAction.id
        })
    case let updateAction as UpdateToDoAction:
        _todos.removeAll(where: {
            $0.id == updateAction.id
        })
        _todos.append(updateAction.updatedToDo)
    default:
        break
    }

    return _todos
}
