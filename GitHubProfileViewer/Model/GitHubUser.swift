//
//  User.swift
//  GitHubProfileViewer
//
//  Created by Fabricio Banda Hernandez on 11/12/25.
//

import Foundation

struct GitHubUser:Decodable{
    let name: String          // nombre del usuario
    let avatar_url: String     // imagen de perfil
    let followers: Int         // nº de seguidores
    let public_repos: Int      // nº de repos públicos
    let repos_url: String      // URL para obtener repos
    let followers_url: String // URL para obtener followers
}
