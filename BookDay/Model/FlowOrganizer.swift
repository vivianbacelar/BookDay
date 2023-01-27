//
//  FlowOrganizer.swift
//  BookDay
//
//  Created by Vivian Bacelar on 26/01/23.
//

import Foundation

class FlowOrganizer: ObservableObject {
    
    enum Screens {
        case book
        case library
//        case parabens
        case home
    }
    
    private var currentScreen: Screens = .home
    
    @Published var shouldPresentBook: Bool = false
    @Published var shouldPresentLibrary: Bool = false
//    @Published var shouldPresentInstrucoes: Bool = false
    
    private func navigateAsync(screen: FlowOrganizer.Screens) {
        switch screen {
        case .book:
            shouldPresentBook = true
            shouldPresentLibrary = false
//            shouldPresentParabens = false
            currentScreen = .book
        case .library:
            shouldPresentLibrary = true
            currentScreen = .library
        case .home:
            shouldPresentBook = false
            shouldPresentLibrary = false
//            shouldPresentParabens = false
            currentScreen = .home
//        case .parabens:
//            shouldPresentParabens = true
//            currentScreen = .parabens
        }
    }
    
    func navigateTo(_ screen: FlowOrganizer.Screens) {
        DispatchQueue.main.async {
            self.navigateAsync(screen: screen)
        }
    }
    
    private func dismissAsync() {
        switch self.currentScreen {
        case .home:
            break
        case .book:
            navigateTo(.home)
        case .library:
            navigateTo(.library)
//        case .home:
//            navigateTo(.home)
        }
    }
    
    func dismiss() {
        DispatchQueue.main.async {
            self.dismissAsync()
        }
    }
}

