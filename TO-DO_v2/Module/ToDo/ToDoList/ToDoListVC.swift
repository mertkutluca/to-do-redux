//
//  ToDoVC.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 22.06.2022.
//

import UIKit
import ReSwift
import ReSwiftRouter

final class ToDoListVC: UIViewController {

    private var todos: [ToDo] = []

    override func loadView() {
        let v = ToDoListView()
        v.delegate = self
        v.dataSource = self

        view = v
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        app.mainStore.subscribe(self)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        app.mainStore.unsubscribe(self)
    }

}

extension ToDoListVC: StoreSubscriber {

    typealias StoreSubscriberStateType = AppState

    func newState(state: AppState) {
        todos = state.todos
        (view as? ToDoListView)?.reload()   // delete insert rows have to be use to implement animations
    }

}

//extension ToDoListVC: Routable {
//
//    static let identifier = "ToDoListVC"
//
//}

extension ToDoListVC: UITableViewDelegate {

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            app.mainStore.dispatch(RemoveToDoAction(title: todos[indexPath.row].title))
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(ToDoDetailVC(), animated: true)

        // TODO: remove this and navigate with uikit, dummy reswiftrouter
//        app.mainStore.dispatch(
//            SetRouteAction(["ToDoNavigationController", ToDoDetailVC.identifier])
//        )
    }

}

extension ToDoListVC: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(todos[indexPath.row].title):  \(todos[indexPath.row].desc)"

        return cell
    }
    
}
