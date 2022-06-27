//
//  ToDoDetailVC.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 27.06.2022.
//

import UIKit

final class ToDoDetailVC: UIViewController {

    override func loadView() {
        super.loadView()
        view = ToDoDetailView()
    }
}
