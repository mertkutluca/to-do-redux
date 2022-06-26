//
//  ToDoView.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 22.06.2022.
//

import UIKit

final class ToDoListView: UIView {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self

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

}

extension ToDoListView: UITableViewDelegate {

}

extension ToDoListView: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row)"

        return cell
    }

}
