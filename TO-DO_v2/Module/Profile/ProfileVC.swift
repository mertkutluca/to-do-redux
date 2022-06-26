//
//  ProfileVC.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 26.06.2022.
//

import UIKit
import ReSwiftRouter

final class ProfileVC: UIViewController {

    override func loadView() {
        super.loadView()
        view = ProfileView()
    }
    
}

extension ProfileVC: Routable {

    static let identifier = "ProfileVC"

}
