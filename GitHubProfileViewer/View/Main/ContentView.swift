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
        userName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    
                    HStack(spacing: 20){
                        
                        TextFieldUser(userName: self.$userName)
                        
              
                        Button{
                            vm.fetchAll(username: self.userName)
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
                        
                       
                    }
                    
                     
                    switch vm.state {
                    case .idle:
                        EmptyView()
                        
                    case .loading:
                        ProgressView("Loading...")
                        
                    case .success:
                        // vista del user
                        UserProfileView(user: vm.user)
                        
                    case .error(let message):
                        ErrorView(message: message)
                    }
                    
                    
                    

                }
                .navigationTitle("GitHub Profile Viewer")
                .padding()
            }.scrollDismissesKeyboard(.interactively)
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            withAnimation {
                                vm.reset()
                                self.userName = ""
                            }
                        } label: {
                            Image(systemName: "arrow.clockwise")
                        }

                    }
                }
        }.onAppear{
            if let lastUsername = UserDefaults.standard.string(forKey: "lastUsername") {
                self.userName = lastUsername
                vm.fetchAll(username: lastUsername)
            }
        }
    }
    
    
    
}







#Preview {
    ContentView().environmentObject(GitHubViewModel())
}
