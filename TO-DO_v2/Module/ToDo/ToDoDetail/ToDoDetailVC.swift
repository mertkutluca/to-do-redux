//
//  ToDoDetailVC.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 27.06.2022.
//

import UIKit

final class ToDoDetailVC: UIViewController {

    private let id: String?

    init(id: String? = nil) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        title = "To Do Detail"
        let v = ToDoDetailView()
        v.userInteraction = self

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

extension ToDoDetailVC: StoreSubscriber {
    
    typealias StateType = AppState

    func newState(state: AppState) {
        if let todo = state.todos.first(where: { $0.id == self.id }) {
            (view as? ToDoDetailView)?.setup(title: todo.title, desc: todo.desc)
        }
    }

}

extension ToDoDetailVC: ToDoDetailViewUserInteraction {

    func saveToDo(title: String, desc: String) {
        if let id = self.id {
            app.mainStore.dispatch(UpdateToDoAction(id: id, newTitle: title, newDesc: desc))
        } else {
            app.mainStore.dispatch(AddToDoAction(title: title, desc: desc))
        }
        popVCAfterAWhile()
    }

    func deleteToDo() {
        guard let id = self.id else { return }
        app.mainStore.dispatch(RemoveToDoAction(id: id))
        popVCAfterAWhile()
    }

    private func popVCAfterAWhile() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.navigationController?.popViewController(animated: true)
        }
    }

}
