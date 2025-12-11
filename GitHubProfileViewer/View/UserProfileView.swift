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
            
            
            Text(user.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
        
                HStack(spacing: 15){
                    
                    UserElement(color: Color.green, image: "person.fill", number: user.followers,text: "followers")
                    
                    UserElement(color: Color.blue, image: "folder.fill", number: user.public_repos,text: "repositories")
                    
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
                    
                }
                
                Spacer()
                
            }
                
           
        }
        .padding()

  
        
    }
}

struct RepositoryView: View {
    let name: String
    let language: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {

            Image(systemName: "folder.fill")
                .font(.system(size: 20))
                .foregroundStyle(.blue)

            VStack(alignment: .leading, spacing: 6) {
                Text(name)
                    .font(.headline)
                    .lineLimit(2)
                    .minimumScaleFactor(0.7)

                Text(language)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.gray.opacity(0.15))
        )
    }
}

struct UserElement:View {
    let color:Color
    let image:String
    let number:Int
    let text:String
    var body: some View {
        HStack{
            
            Image(systemName:image)
                .foregroundStyle(color)
                .bold()
            
            Text("\(number) \(text)")
            
        }.font(.headline)
    }
}


#Preview {
    UserProfileView(user: GitHubUser(name: "Fabricio Banda", avatar_url: "https://avatars.githubusercontent.com/u/196128651?v=4", followers: 1, public_repos: 1, repos_url: "", followers_url: "")).environmentObject(GitHubViewModel())
}
