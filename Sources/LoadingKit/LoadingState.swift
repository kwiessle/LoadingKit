//
//  LoadingState.swift
//  LoadingKit
//
//  Created by kiefer on 29/01/2026.
//

import Foundation

public enum LoadingState<Value> {
    
    case idle
    case loading
    case loaded(Value)
    case failed(Error)
    
}

extension LoadingState: Equatable where Value: Equatable {
    
    public static func == (lhs: LoadingState<Value>, rhs: LoadingState<Value>) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle): return true
        case (.loading, .loading): return true
        case (.loaded(let lhsValue), .loaded(let rhsValue)): return lhsValue == rhsValue
        case (.failed(let lhsError), .failed(let rhsError)): return lhsError as NSError == rhsError as NSError
        default: return false
        }
    }
    
}
