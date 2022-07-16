//
//  ToDoReducer.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 26.06.2022.
//

func AppReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
        todos: toDoReducer(action: action, todos: state?.todos)
//        navigationState: NavigationReducer.handleAction(action, state: state?.navigationState)
    )
}

func toDoReducer(action: Action, todos: [ToDo]?) -> [ToDo] {
    var todos = todos ?? []

    switch action {
    case let addAction as AddToDoAction:
        todos.append(addAction.toDoToAdd)
    case let removeAction as RemoveToDoAction:
        todos.removeAll(where: {
            $0.id == removeAction.id
        })
    case let updateAction as UpdateToDoAction:
        todos.removeAll(where: {
            $0.id == updateAction.id
        })
        todos.append(updateAction.updatedToDo)
    default:
        break
    }

    return todos
}
