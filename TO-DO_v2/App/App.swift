//
//  App.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 26.06.2022.
//

import UIKit
import ReSwift

let app: App = App()

final class App: NSObject {

    let mainStore = Store<AppState>(
        reducer: AppReducer,
        state: nil
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
