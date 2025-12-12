//
//  AvatarView.swift
//  GitHubProfileViewer
//
//  Created by Fabricio Banda Hernandez on 12/12/25.
//

import SwiftUI

struct AvatarView: View {
    @Environment(\.dismiss) var dismiss
    let url:String
    var body: some View {
        NavigationStack{
            VStack(alignment: .center){
                ImageView(url: url, size: 280)
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName:"xmark")
                    }

                }
            }
        }
    }
}

#Preview {
    AvatarView(url: "https://avatars.githubusercontent.com/u/133921941?v=4")
}
