//
//  ToDoView.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 22.06.2022.
//

import UIKit

final class ToDoListView: UIView {

    weak var delegate: UITableViewDelegate?
    weak var dataSource: UITableViewDataSource?

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.backgroundColor = .systemBackground

        return tableView
    }()

    public override func didMoveToWindow() {
        super.didMoveToWindow()

        backgroundColor = .systemBackground
        addSubview(tableView)
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            topAnchor.constraint(equalTo: tableView.topAnchor),
            trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
        ])
    }

    func reload() {
        print("Reload")
        tableView.reloadData()
    }

}
