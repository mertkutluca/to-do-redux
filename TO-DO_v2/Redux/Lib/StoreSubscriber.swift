//
//  StoreSubscriber.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 17.07.2022.
//

import Foundation

protocol StoreSubscriber: AnyStoreSubscriber {
    associatedtype StateType
    func newState(state: StateType)
}

protocol AnyStoreSubscriber: AnyObject {
    func _newState(state: Any)
}

extension StoreSubscriber {
    public func _newState(state: Any) {
        if let typedState = state as? StateType {
            newState(state: typedState)
        }
    }
}
