//
//  AddTodoAction.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 26.06.2022.
//

import ReSwift

struct AddToDoAction: Action {
    let title: String
    let desc: String

    var toDoToAdd: ToDo {
        return ToDo(title: title, desc: desc)
    }
}
