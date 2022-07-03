//
//  ToDoDetailView.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 27.06.2022.
//

import UIKit

protocol ToDoDetailViewUserInteraction: AnyObject {
    func saveToDo(title: String, desc: String)
    func deleteToDo()
}

final class ToDoDetailView: UIView {

    weak var userInteraction: ToDoDetailViewUserInteraction?

    private lazy var titleField: UITextField = {
        let textField: UITextField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints  = false
        textField.placeholder = "Title"
        textField.addBorder()
        textField.textColor = .darkText
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0)

        return textField
    }()

    private lazy var descriptionField: UITextField = {
        let textField: UITextField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints  = false
        textField.placeholder = "Description"
        textField.addBorder()
        textField.contentVerticalAlignment = .top
        textField.textColor = .darkText
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(8, 8, 0)

        return textField
    }()

    private lazy var saveButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(self.saveToDo), for: .touchUpInside)
        button.backgroundColor = .lightGray

        return button
    }()

    private lazy var deleteButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Delete", for: .normal)
        button.addTarget(self, action: #selector(self.deleteToDo), for: .touchUpInside)
        button.backgroundColor = .systemRed

        return button
    }()

    @objc private func saveToDo() {
        guard let title = titleField.text, let desc = descriptionField.text else { return }
        userInteraction?.saveToDo(title: title, desc: desc)
    }
    
    @objc private func deleteToDo() {
        userInteraction?.deleteToDo()
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        backgroundColor = .systemBackground
        addSubview(titleField)
        addSubview(descriptionField)
        addSubview(saveButton)
        addSubview(deleteButton)
        NSLayoutConstraint.activate([
            titleField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            titleField.heightAnchor.constraint(equalToConstant: 48),
            titleField.topAnchor.constraint(equalTo: topAnchor, constant: 128),

            descriptionField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            descriptionField.heightAnchor.constraint(equalToConstant: 144),
            descriptionField.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 24),

            saveButton.heightAnchor.constraint(equalToConstant: 36),
            saveButton.widthAnchor.constraint(equalToConstant: 96),
            saveButton.topAnchor.constraint(equalTo: descriptionField.bottomAnchor, constant: 24),
            saveButton.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -24),

            deleteButton.heightAnchor.constraint(equalToConstant: 36),
            deleteButton.widthAnchor.constraint(equalToConstant: 96),
            deleteButton.topAnchor.constraint(equalTo: descriptionField.bottomAnchor, constant: 24),
            deleteButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 24),
        ])
    }

    func setup(title: String, desc: String) {
        titleField.text = title
        descriptionField.text = desc
    }
    
}
