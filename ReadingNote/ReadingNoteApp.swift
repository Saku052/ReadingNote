//
//  ReadingNoteApp.swift
//  ReadingNote
//
//  Created by Sora Harada on 20/7/2024.
//

import SwiftUI

@main
struct ReadingNoteApp: App {
    
    @StateObject private var dataControllor = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataControllor.container.viewContext)
        }
    }
}
