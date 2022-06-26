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

        return tableView
    }()

    public override func didMoveToWindow() {
        super.didMoveToWindow()

        addSubview(tableView)
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            topAnchor.constraint(equalTo: tableView.topAnchor),
            trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
        ])
    }

    public override init(frame: CGRect) {
      super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func reload() {
        print("Reload")
        tableView.reloadData()
    }

}
