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
    
    @Published var user:GitHubUser = GitHubUser(name: "", avatar_url: "", followers: 0, public_repos: 0)
    
    @Published var repos:[Repository] = []
    
    @Published var followers:[Follower] = []
    
    // MARK: Funciones de fetch
    
    
    func fetchAll(username:String){
        
        state = .loading
        user = GitHubUser(name: "", avatar_url: "", followers: 0, public_repos: 0)
        repos = []
        followers = []
        
        getUser(username: username)
        getRepositories(username: username)
        getFollowers(username: username)
    }
    
    func getUser(username:String){
        
        guard let urlUser = URL(string: "https://api.github.com/users/\(username)") else {return}
        
        Task{
            
            do{
                
                self.state = .loading
                
                let (data,_) = try await URLSession.shared.data(from: urlUser)
                
                let json = try JSONDecoder().decode(GitHubUser.self, from: data)
                
                self.user = json
                self.state = .success
                
            }catch let error as NSError{
                self.state = .error("Hubo un error al cargar los datos")
                print("Error in user : \(error.localizedDescription)")
            }
            
        }
        
        
    }
    
    
    func getRepositories(username:String){
        guard let urlRepository = URL(string: "https://api.github.com/users/\(username)/repos") else {return}
        
        Task{
            do{
                let (data,_) = try await URLSession.shared.data(from: urlRepository)
                let json = try JSONDecoder().decode([Repository].self, from: data)
                
                self.repos = json
                
            }catch let error as NSError{
                print("Error in repos : \(error.localizedDescription)")
            }
        }
        
    }
    
    
    func getFollowers(username:String){
        guard let urlFollower = URL(string: "https://api.github.com/users/\(username)/followers") else {return}
        
        Task{
            do{
                let (data,_) = try await URLSession.shared.data(from: urlFollower)
                let json = try JSONDecoder().decode([Follower].self, from: data)
                
                self.followers = json
                
            }catch let error as NSError{
                print("Error in followers: \(error.localizedDescription)")
            }
        }
        
    }
    
    
    
}
