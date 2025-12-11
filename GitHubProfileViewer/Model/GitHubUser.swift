//
//  User.swift
//  GitHubProfileViewer
//
//  Created by Fabricio Banda Hernandez on 11/12/25.
//

import Foundation

struct GitHubUser:Decodable{
    let name: String
    let avatar_url: String
    let followers: Int
    let public_repos: Int
    let repos_url: String      
    let followers_url: String
}
