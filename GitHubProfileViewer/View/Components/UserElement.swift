//
//  UserElement.swift
//  GitHubProfileViewer
//
//  Created by Fabricio Banda Hernandez on 11/12/25.
//


import SwiftUI

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