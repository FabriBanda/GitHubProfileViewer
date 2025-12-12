//
//  Follower.swift
//  GitHubProfileViewer
//
//  Created by Fabricio Banda Hernandez on 11/12/25.
//

import Foundation


struct Follower:Decodable{
    let id:Int
    let login:String
    let avatar_url:String
}
