//
//  ErrorView.swift
//  GitHubProfileViewer
//
//  Created by Fabricio Banda Hernandez on 12/12/25.
//


import SwiftUI

struct ErrorView:View {
    let message:String
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.largeTitle)
                .foregroundStyle(.red)

            Text(message)
                .font(.headline)
                .multilineTextAlignment(.center)
        }
    }
}