//
//  ToDoNavigationController.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 28.06.2022.
//

import UIKit
import ReSwiftRouter

final class ToDoNavigationController: UINavigationController {
    
}

extension ToDoNavigationController: Routable {

    static let identifier = "ToDoNavigationController"

//    func pushRouteSegment(_ routeElementIdentifier: RouteElementIdentifier, animated: Bool, completionHandler: @escaping RoutingCompletionHandler) -> Routable {
//        if (routeElementIdentifier == ToDoDetailVC.identifier) {
//            completionHandler()
//            return ToDoDetailVC()
//        }
//        fatalError()
//    }
//
//    func changeRouteSegment(_ from: RouteElementIdentifier, to: RouteElementIdentifier, animated: Bool, completionHandler: @escaping RoutingCompletionHandler) -> Routable {
//        return ToDoDetailVC()
//    }
    
}
