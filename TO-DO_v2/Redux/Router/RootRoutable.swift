//
//  RootRoutable.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 26.06.2022.
//

import ReSwiftRouter

final class RootRoutable: Routable {

    let routable: Routable

    init(routable: Routable) {
        self.routable = routable
    }

    public func pushRouteSegment(
        _ routeElementIdentifier: RouteElementIdentifier,
        animated: Bool,
        completionHandler: @escaping RoutingCompletionHandler
    ) -> Routable {
        completionHandler()
        return self.routable
    }

    public func popRouteSegment(
        _ routeElementIdentifier: RouteElementIdentifier,
        animated: Bool,
        completionHandler: @escaping RoutingCompletionHandler) {
            completionHandler()
    }

    func changeRouteSegment(_ from: RouteElementIdentifier, to: RouteElementIdentifier, animated: Bool, completionHandler: @escaping RoutingCompletionHandler) -> Routable {
        completionHandler()
        return self.routable
    }
    
}
