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

final class Store<StateType: State> {
    var reducer: Reducer<StateType>
    var state: StateType?
    var subscribers: [AnyStoreSubscriber] = []

    init(reducer: @escaping Reducer<StateType>, state: StateType?) {
        self.reducer = reducer
        self.state = state
    }

    func dispatch(_ action: Action) {
        state = reducer(action, state)
        subscribers.forEach { $0._newState(state: state!) }
    }

    func subscribe(_ newSubscriber: AnyStoreSubscriber) {
        subscribers.append(newSubscriber)
        subscribers.forEach { $0._newState(state: state!) }
    }
    
    func unsubscribe(_ subscriber: AnyStoreSubscriber) {
     for (index, value ) in subscribers.enumerated() where value === subscriber {
      if index < subscribers.count {
        self.subscribers.remove(at: index)
      }
    }
  }
}
