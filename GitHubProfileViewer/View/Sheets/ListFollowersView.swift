//
//  ListFollowersView.swift
//  GitHubProfileViewer
//
//  Created by Fabricio Banda Hernandez on 11/12/25.
//

import SwiftUI

struct ListFollowersView: View {
    @EnvironmentObject var model:GitHubViewModel
    @Environment(\.dismiss) var dimiss
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(model.followers,id:\.id){ follower in
                        HStack(spacing: 20){
                            
                           RowFollower(follower: follower)
                            
                        }.listRowSeparator(.hidden)
                       
                    }
                }.listStyle(.plain)
            }
            .navigationTitle("Followers")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dimiss()
                    } label: {
                        Image(systemName: "xmark")
                    }

                }
            }
        }
    }
}

struct RowFollower:View {
    let follower:Follower
    var body: some View {
        
        ImageView(url: follower.avatar_url, size: 80)
        
        Text(follower.login)
            .font(.title3)
            .foregroundStyle(.primary)
            .bold()
    }
}



#Preview {
    ListFollowersView().environmentObject(GitHubViewModel())
}
