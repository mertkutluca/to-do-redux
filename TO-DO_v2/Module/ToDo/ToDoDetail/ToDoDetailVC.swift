//
//  ToDoDetailVC.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 27.06.2022.
//

import UIKit
import ReSwiftRouter

final class ToDoDetailVC: UIViewController {

    override func loadView() {
        super.loadView()
        view = ToDoDetailView()
        title = "To Do Detail"
    }

}

extension ToDoDetailVC: Routable {
    static let identifier = "ToDoDetailVC"
}
