//
//  RepositoryRowView.swift
//  GitHubProfileViewer
//
//  Created by Fabricio Banda Hernandez on 12/12/25.
//


import SwiftUI

struct RepositoryRowView: View {
    let repo: Repository
    let showAll: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            // name repo
            HStack(alignment: .top, spacing: 10) {
                Image(systemName: "folder.fill")
                    .font(.title3)
                    .foregroundStyle(.blue)

                Text(repo.name)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .lineLimit(2)
                    .minimumScaleFactor(0.7)

                Spacer()

                if repo.fork && showAll{
                    Label("Fork", systemImage: "arrow.triangle.branch")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            // description
            if self.showAll {
                if let description = repo.description{
                    Text(description)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(4)
                        .minimumScaleFactor(0.7)
                    
                } else {
                    Text("No description")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .italic()
                }
            }



            HStack {
                Label(repo.language ?? "Unknown", systemImage: "chevron.left.forwardslash.chevron.right")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Spacer()
            }
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray.opacity(0.15))
        )
    }
}