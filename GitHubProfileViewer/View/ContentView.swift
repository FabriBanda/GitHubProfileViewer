//
//  ContentView.swift
//  GitHubProfileViewer
//
//  Created by Fabricio Banda Hernandez on 11/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var userName:String = ""
    @EnvironmentObject var vm:GitHubViewModel
    private var isUsernameEmpty: Bool {
        userName.trimmingCharacters(in: .whitespaces) == ""
    }
    
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
                        vm.fetchAll(username: "binizaa")
                    }label: {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                    }
                    .padding(10)
                    .background(self.isUsernameEmpty ? Color.gray:Color.blue,in:Circle())
                    .animation(.interactiveSpring(duration: 1), value: self.isUsernameEmpty)
                    .disabled(self.isUsernameEmpty)
                    
                    
                    Spacer()
                }
                
                Spacer()
                
                switch vm.state {
                case .idle:
                    EmptyView()
                    
                case .loading:
                    ProgressView("Loading...")
                    
                case .success:
                    // vista del user
                    UserProfileView(user: vm.user)
                    
                case .error:
                    Text("Error")
                }
                

                
                Spacer()
                
                
          
                
            }
            .navigationTitle("GitHub Profile Viewer")
            .padding()
        }
    }
}

#Preview {
    ContentView().environmentObject(GitHubViewModel())
}
