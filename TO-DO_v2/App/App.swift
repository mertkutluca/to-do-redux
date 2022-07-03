//
//  App.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 26.06.2022.
//

import UIKit

let app: App = App()

final class App: NSObject {

    // Has to be changed with db result some similar thing in real implementation
    private static var initialState: AppState {
        var state = AppState()
        state.todos = [
            ToDo.dummy(index: 1),
            ToDo.dummy(index: 2),
            ToDo.dummy(index: 3),
            ToDo.dummy(index: 4),
            ToDo.dummy(index: 5),
            ToDo.dummy(index: 6),
            ToDo.dummy(index: 7),
            ToDo.dummy(index: 8),
            ToDo.dummy(index: 9)
        ]

        return state
    }


    let mainStore = Store<AppState>(
        reducer: AppReducer,
        state: App.initialState
    )

    var toDoListVC: ToDoListVC!
    var profileVC: ProfileVC!

    var toDoNavigationVC: UINavigationController!

    func start(with window: UIWindow) {
        let tabBarVC = UITabBarController()
        toDoListVC = ToDoListVC()
        profileVC = ProfileVC()
        toDoListVC.title = "To Do List"
        profileVC.title = "Profile"
        toDoNavigationVC = ToDoNavigationController(rootViewController: toDoListVC)
        tabBarVC.viewControllers = [toDoNavigationVC, profileVC]

        window.rootViewController = tabBarVC
    }

}
