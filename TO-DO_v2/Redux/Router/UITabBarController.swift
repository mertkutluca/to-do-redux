//
//  UITabBarController.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 26.06.2022.
//

import UIKit
import ReSwiftRouter

extension UITabBarController: Routable {

    public func changeRouteSegment(_ fromSegment: RouteElementIdentifier,
        to: RouteElementIdentifier,
        animated: Bool,
        completionHandler: @escaping RoutingCompletionHandler) -> Routable {
            if (to == ToDoNavigationController.identifier) {
                selectedIndex = 0
                completionHandler()
                return viewControllers![0] as! Routable
            } else if (to == ProfileVC.identifier) {
                selectedIndex = 1
                completionHandler()
                return viewControllers![1] as! Routable
            }

            abort()
    }

    public func pushRouteSegment(
        _ routeElementIdentifier: RouteElementIdentifier,
        animated: Bool,
        completionHandler: @escaping RoutingCompletionHandler) -> Routable {
            if (routeElementIdentifier == ToDoNavigationController.identifier) {
                selectedIndex = 0
                completionHandler()
                return viewControllers![0] as! Routable
            } else if (routeElementIdentifier == ProfileVC.identifier) {
                selectedIndex = 1
                completionHandler()
                return viewControllers![1] as! Routable
            }

            abort()
    }

    public func popRouteSegment(_ viewControllerIdentifier: RouteElementIdentifier,
        animated: Bool,
        completionHandler: @escaping RoutingCompletionHandler) {
            // would need to unset root view controller here
            completionHandler()
    }

}
