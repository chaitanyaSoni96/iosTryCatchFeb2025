//
//  swiftui_basicsApp.swift
//  swiftui basics
//
//  Created by Chaitanya Soni on 19/02/25.
//

import SwiftUI

@main
struct swiftui_basicsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
