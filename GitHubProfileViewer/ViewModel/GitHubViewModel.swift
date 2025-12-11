//
//  GitHubViewModel.swift
//  GitHubProfileViewer
//
//  Created by Fabricio Banda Hernandez on 11/12/25.
//

import Foundation
import Combine


@MainActor
final class GitHubViewModel:ObservableObject{
    
    @Published var user:GitHubUser = GitHubUser(name: "", avatar_url: "", followers: 0, public_repos: 0, repos_url: "", followers_url: "")
    
    func getUser(username:String){
        
        guard let urlUser = URL(string: "https://api.github.com/users/\(username)") else {return}
        Task{
            
            do{
            
                let (data,_) = try await URLSession.shared.data(from: urlUser)
                
                let json = try JSONDecoder().decode(GitHubUser.self, from: data)
                
                self.user = json
                
                
            }catch let error as NSError{
                print("Error: \(error.localizedDescription)")
            }
            
        }
        
    }
    
    
    
}
