//
//  TextFieldUser.swift
//  GitHubProfileViewer
//
//  Created by Fabricio Banda Hernandez on 12/12/25.
//


import SwiftUI

struct TextFieldUser:View {
    @Binding var userName:String
    var body: some View {
        
        TextField("Username", text: self.$userName)
            .font(.title3)
            .padding(10)
            .background(Color.gray.opacity(0.15),in:RoundedRectangle(cornerRadius: 25))
            .autocorrectionDisabled(true)
    }
}