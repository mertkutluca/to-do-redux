//
//  Store.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 3.07.2022.
//

import Foundation

protocol Action {}

protocol State {}

typealias Reducer<StateType: State> = (_ action: Action, _ state: StateType?) -> StateType

protocol StoreSubscriber: AnyObject {
    func newState(state: State)
}

final class Store<StateType: State> {
    var reducer: Reducer<StateType>
    var state: StateType?
    var subscribers: [StoreSubscriber] = []

    init(reducer: @escaping Reducer<StateType>, state: StateType?) {
        self.reducer = reducer
        self.state = state
    }

    func dispatch(_ action: Action) {
        state = reducer(action, state)
        subscribers.forEach { $0.newState(state: state!) }
    }

    func subscribe(_ newSubscriber: StoreSubscriber) {
        subscribers.append(newSubscriber)
        subscribers.forEach { $0.newState(state: state!) }
    }
    
    func unsubscribe(_ subscriber: StoreSubscriber) {
     for (index, value ) in subscribers.enumerated() where value === subscriber {
      if index < subscribers.count {
        self.subscribers.remove(at: index)
      }
    }
  }
}
