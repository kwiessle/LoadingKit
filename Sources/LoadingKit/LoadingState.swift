//
//  LoadingState.swift
//  LoadingKit
//
//  Created by kiefer on 29/01/2026.
//

public enum LoadingState<Value> {
    
    case idle
    case loading
    case loaded(Value)
    case failed(Error)
    
}


