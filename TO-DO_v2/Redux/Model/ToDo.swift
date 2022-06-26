//
//  ToDo.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 26.06.2022.
//

import Foundation

struct ToDo {
    let title: String
    let desc: String
}

extension ToDo {

    static func dummy(id: Int) -> ToDo {
        return ToDo(title: "title\(id)", desc: "description\(id)")
    }
    
}
