//
//  Repository.swift
//  GitHubProfileViewer
//
//  Created by Fabricio Banda Hernandez on 11/12/25.
//

import Foundation



struct Repository:Decodable{
    let id: Int
    let name: String
    let language: String?
}
