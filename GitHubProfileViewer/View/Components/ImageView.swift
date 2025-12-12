//
//  ImageView.swift
//  GitHubProfileViewer
//
//  Created by Fabricio Banda Hernandez on 12/12/25.
//

import SwiftUI

struct ImageView: View {
    let url:String
    let size:CGFloat
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .scaledToFill()
            
        } placeholder: {
            ProgressView()
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
    }
}

