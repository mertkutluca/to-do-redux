//
//  App.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 26.06.2022.
//

import UIKit
import ReSwift

let app: App = App()

final class App {

    fileprivate init() {}

    let mainStore = Store<AppState>(
        reducer: toDoReducer,
        state: nil
    )

    func start(with window: UIWindow) {
        let vc = ToDoListVC()
        let navigationController = UINavigationController(rootViewController: vc)
        window.rootViewController = navigationController
    }

}
