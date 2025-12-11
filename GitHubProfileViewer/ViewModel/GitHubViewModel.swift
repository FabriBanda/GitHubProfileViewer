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
    
    
    // estados posibles
    enum ViewState{
        case idle
        case loading
        case success
        case error(String)
    }
    
    
    
    // Variables @Published
    @Published var state: ViewState = .idle
    
    @Published var user:GitHubUser = GitHubUser(name: "", avatar_url: "", followers: 0, public_repos: 0, repos_url: "", followers_url: "")
    
    @Published var repos:[Repository] = []
    
    // MARK: Funciones de fetch
    
    
    func getUser(username:String){
        
        guard let urlUser = URL(string: "https://api.github.com/users/\(username)") else {return}
        
        Task{
            
            do{
            
                self.state = .loading
                
                let (data,_) = try await URLSession.shared.data(from: urlUser)
                
                let json = try JSONDecoder().decode(GitHubUser.self, from: data)
                
                self.user = json
                self.state = .success
                getRepositories(url: self.user.repos_url)
                
            }catch let error as NSError{
                self.state = .error("Hubo un error al cargar los datos")
                print("Error: \(error.localizedDescription)")
            }
            
        }
        
    }
    
    func getRepositories(url:String){
        guard let urlRepository = URL(string: url) else {return}
        
        Task{
            do{
                let (data,_) = try await URLSession.shared.data(from: urlRepository)
                let json = try JSONDecoder().decode([Repository].self, from: data)
                
                self.repos = json
                
            }catch let error as NSError{
                print("Error: \(error.localizedDescription)")
            }
        }
        
    }
    
    
    
}
