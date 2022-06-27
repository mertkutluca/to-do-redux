//
//  ToDoDetailView.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 27.06.2022.
//

import UIKit

final class ToDoDetailView: UIView {

    private lazy var titleField: UITextField = {
        let textField: UITextField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints  = false
        textField.placeholder = "Title"

        return textField
    }()

    private lazy var descriptionField: UITextField = {
        let textField: UITextField = UITextField(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        textField.translatesAutoresizingMaskIntoConstraints  = false
        textField.placeholder = "Description"

        return textField
    }()
    

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        backgroundColor = .systemBackground
        addSubview(titleField)
        addSubview(descriptionField)
        NSLayoutConstraint.activate([
            titleField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            titleField.heightAnchor.constraint(equalToConstant: 48),
            titleField.topAnchor.constraint(equalTo: topAnchor, constant: 24),

            descriptionField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            descriptionField.heightAnchor.constraint(equalToConstant: 144),
            descriptionField.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 24),
        ])
    }
    
}
