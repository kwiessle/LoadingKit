//
//  Loadable.swift
//  LoadingKit
//
//  Created by kiefer on 29/01/2026.
//

@MainActor
public protocol Loadable {
    
    associatedtype Value
    
    var loadingState: LoadingState<Value> { get set }
    
}


