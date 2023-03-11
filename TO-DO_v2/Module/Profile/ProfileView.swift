//
//  ProfileView.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 26.06.2022.
//

import UIKit

final class ProfileView: UIView {

    private lazy var dummyDescription: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This is profile view"

        return label
    }()

    public override func didMoveToWindow() {
        super.didMoveToWindow()

        backgroundColor = .cyan
        
        addSubview(dummyDescription)
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: dummyDescription.centerXAnchor),
            centerYAnchor.constraint(equalTo: dummyDescription.centerYAnchor),
        ])
    }

    public override init(frame: CGRect) {
      super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
