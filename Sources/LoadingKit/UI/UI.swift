//
//  OnLoadingStateChangeViewModifier.swift
//  LoadingKit
//
//  Created by Kiefer Wiessler on 02/02/2026.
//

import SwiftUI

struct OnLoadingStateChangeViewModifier<L: Loadable>: ViewModifier where L.Value: Equatable {
    
    let loadable: L
    let action: (LoadingState<L.Value>) -> Void
    
    init(loadable: L, action: @MainActor @escaping (LoadingState<L.Value>) -> Void) {
        self.loadable = loadable
        self.action = action
    }
    
    
    func body(content: Content) -> some View {
        content
            .onChange(of: loadable.loadingState) {
                action(loadable.loadingState)
            }
    }
}

public extension View {
    
    func onLoaded<L: Loadable>(of loadable: L, perform: @MainActor @escaping (L.Value) -> Void) -> some View where L.Value: Equatable {
        modifier(
            OnLoadingStateChangeViewModifier(loadable: loadable, action: { state in
                if case .loaded(let value) = state {
                    perform(value)
                }
            })
        )
    }
    
    
    func onFailure<L: Loadable>(of loadable: L, perform: @MainActor @escaping (Error) -> Void) -> some View where L.Value: Equatable {
        modifier(
            OnLoadingStateChangeViewModifier(loadable: loadable, action: { state in
                if case .failed(let error) = state {
                    perform(error)
                }
            })
        )
    }
    
    func onLoading<L: Loadable>(of loadable: L, perform: @MainActor @escaping () -> Void) -> some View where L.Value: Equatable {
        modifier(
            OnLoadingStateChangeViewModifier(loadable: loadable, action: { state in
                if case .loading = state {
                    perform()
                }
            })
        )
    }
    
}
