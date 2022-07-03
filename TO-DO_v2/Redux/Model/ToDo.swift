//
//  ToDo.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 26.06.2022.
//

import Foundation

struct ToDo {
    let id: String
    let title: String
    let desc: String

    init(id: String = UUID().uuidString, title: String, desc: String) {
        self.id = id
        self.title = title
        self.desc = desc
    }
}

extension ToDo {

    static func dummy(index: Int) -> ToDo {
        return ToDo(title: "title\(index)", desc: "description\(index)")
    }
    
}
