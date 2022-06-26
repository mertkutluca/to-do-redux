//
//  ToDoReducer.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 26.06.2022.
//

import ReSwift

func toDoReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()

    switch action {
    case let addAction as AddToDoAction:
        state.todos.append(addAction.toDoToAdd)
    case let removeAction as RemoveToDoAction:
        state.todos.removeAll(where: {
            $0.title == removeAction.title
        })
    case _ as UpdateToDoAction:
        fatalError()
    default:
        break
    }

    return state
}
