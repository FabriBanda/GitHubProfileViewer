//
//  UserProfileView.swift
//  GitHubProfileViewer
//
//  Created by Fabricio Banda Hernandez on 11/12/25.
//

import SwiftUI

struct UserProfileView: View {
    @EnvironmentObject var model:GitHubViewModel
    let user:GitHubUser
    var body: some View {
        
        NavigationStack{
            VStack(spacing: 15){
                AsyncImage(url: URL(string: user.avatar_url)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                    
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 130, height: 130)
                .clipShape(Circle())
                .onTapGesture {
                    // sheet con foto ampliada
                }
                
                Text(user.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                
                HStack(spacing: 15){
                    
                    UserElement(color: Color.green, image: "person.fill", number: user.followers,text: "followers").onTapGesture {
                        // sheet con lista de followers
                    }
                    
                    UserElement(color: Color.blue, image: "folder.fill", number: user.public_repos,text: "repositories").onTapGesture {
                        // sheet con lista de repositorios
                        
                        
                    }
                    
                }
                
                
                
                Divider()
                HStack {
                    
                    VStack(alignment: .leading,spacing: 15){
                        
                        Text("First 2 Repositories")
                            .font(.title2)
                            .bold()
                        
                        
                        ForEach(model.repos.prefix(2),id:\.id) { repo in
                            RepositoryView(name: repo.name, language: repo.language ?? "N/A")
                        }
                        
                        NavigationLink {
                            ListRepositoriesView()
                        } label: {
                            
                            Text("Ver mas")
                                .font(.subheadline)
                                .foregroundStyle(Color(.systemBackground))
                                .padding(10)
                                .background(Color.blue,in:RoundedRectangle(cornerRadius: 20))
                        }
                        
                        
                        
                    }
                    
                    
                    
                    
                    Spacer()
                    
                }
                
                
            }
            .padding()
        }
        
        
        
    }
}






#Preview {
    UserProfileView(user: GitHubUser(name: "Fabricio Banda", avatar_url: "https://avatars.githubusercontent.com/u/196128651?v=4", followers: 1, public_repos: 1)).environmentObject(GitHubViewModel())
}
