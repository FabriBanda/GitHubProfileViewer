//
//  GitHubProfileViewerApp.swift
//  GitHubProfileViewer
//
//  Created by Fabricio Banda Hernandez on 11/12/25.
//

import SwiftUI

@main
struct GitHubProfileViewerApp: App {
    @StateObject var model = GitHubViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
