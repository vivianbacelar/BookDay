//
//  BookDayApp.swift
//  BookDay
//
//  Created by Vivian Bacelar on 24/01/23.
//

import SwiftUI

@main
struct BookDayApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    init() {
        DAO.shared.load()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .onChange(of: scenePhase) { newPhase in
                if newPhase == .inactive {
                    DAO.shared.save()
                }
                if newPhase == .background {
                    DAO.shared.save()
                }
                
            }
        }
    }
}
