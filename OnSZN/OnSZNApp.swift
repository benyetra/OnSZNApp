//
//  OnSZNApp.swift
//  OnSZN
//
//  Created by Bennett Yetra on 11/23/20.
//

import SwiftUI

@main
struct OnSZNApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
