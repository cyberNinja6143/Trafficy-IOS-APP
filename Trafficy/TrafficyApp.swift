//
//  TrafficyApp.swift
//  Trafficy
//
//  Created by Ariyan Shaikh on 9/14/24.
//

import SwiftUI

@main
struct TrafficyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
