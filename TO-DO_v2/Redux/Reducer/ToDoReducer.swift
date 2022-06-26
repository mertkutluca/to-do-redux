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
    case _ as AddToDoAction:
        state.todos.append((action as! AddToDoAction).toDoToAdd)
    case _ as RemoveToDoAction:
        state.todos.removeAll(where: {
            $0.title == (action as! RemoveToDoAction).title
        })
    case _ as UpdateToDoAction:
        fatalError()
    default:
        print("default deffff")
    }

    return state
}
