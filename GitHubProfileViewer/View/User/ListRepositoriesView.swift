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
                RepositoryRowView(repo: repo,showAll: true)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Repositories")
    }
}



#Preview {
    ListRepositoriesView().environmentObject(GitHubViewModel())
}
