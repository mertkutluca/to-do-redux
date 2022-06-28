//
//  App.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 26.06.2022.
//

import UIKit
import ReSwift
import ReSwiftRouter

let app: App = App()

final class App: NSObject {

    let mainStore = Store<AppState>(
        reducer: AppReducer,
        state: nil
    )

    var router: Router<AppState>!
    var rootVC: Routable!
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
        tabBarVC.delegate = self
        rootVC = tabBarVC

        router = Router(store: mainStore, rootRoutable: RootRoutable(routable: rootVC)) { state in
            state.select { $0.navigationState }
        }

        window.rootViewController = tabBarVC
    }

}

extension App: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController,
        shouldSelect viewController: UIViewController) -> Bool {

        if viewController is ToDoNavigationController {
            mainStore.dispatch(
                SetRouteAction(["TabBarViewController", ToDoNavigationController.identifier])
            )
        } else if viewController is ProfileVC {
            mainStore.dispatch(
                SetRouteAction(["TabBarViewController", ProfileVC.identifier])
            )
        }

        return false
    }

}
