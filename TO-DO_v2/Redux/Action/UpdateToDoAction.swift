//
//  UpdateToDoAction.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 26.06.2022.
//

import SwiftRedux

struct UpdateToDoAction: Action {
    let id: String
    let newTitle: String
    let newDesc: String

    var updatedToDo: ToDo {
        return ToDo(id: id, title: newTitle, desc: newDesc)
    }
}

