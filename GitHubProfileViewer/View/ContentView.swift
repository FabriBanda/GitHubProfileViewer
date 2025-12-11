//
//  ContentView.swift
//  GitHubProfileViewer
//
//  Created by Fabricio Banda Hernandez on 11/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var userName:String = ""
    @StateObject var vm = GitHubViewModel()
    var body: some View {
        NavigationStack {
            VStack{
                
                HStack(spacing: 5){
    
                    TextField("Username", text: self.$userName)
                        .font(.title3)
                        .padding(10)
                        .background(Color.gray.opacity(0.3),in:RoundedRectangle(cornerRadius: 25))
                        .autocorrectionDisabled(true)
                    
                    Spacer()
                    Button{
                        vm.getUser(username: "FabriBanda")
                    }label: {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                    }
                    .padding(10)
                    .background(Color.blue,in:Circle())
                    Spacer()
                }
                
                //Text("User Name: \(vm.user.name)")
               // Text("Followers: \(vm.user.followers)")
                
                Spacer()
                
                
          
                
            }
            .navigationTitle("GitHub Profile Viewer")
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
