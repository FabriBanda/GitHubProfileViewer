//
//  ListRepositoriesView.swift
//  GitHubProfileViewer
//
//  Created by Fabricio Banda Hernandez on 11/12/25.
//

import SwiftUI

struct ListRepositoriesView: View {
    @EnvironmentObject var model: GitHubViewModel

    var body: some View {
        List {
            ForEach(model.repos, id: \.id) { repo in
                RepositoryRowView(repo: repo)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Repositories")
    }
}

struct RepositoryRowView: View {
    let repo: Repository

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
                    .lineLimit(1)

                Spacer()

                if repo.fork {
                    Label("Fork", systemImage: "arrow.triangle.branch")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            // description
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

#Preview {
    ListRepositoriesView().environmentObject(GitHubViewModel())
}
