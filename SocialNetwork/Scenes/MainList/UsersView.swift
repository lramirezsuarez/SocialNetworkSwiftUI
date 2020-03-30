//
//  ContentView.swift
//  SocialNetwork
//
//  Created by Luis Ramirez on 26/03/20.
//  Copyright © 2020 Lramirez. All rights reserved.
//

import SwiftUI

struct UsersView: View {
    @State private var users = [User]()
    @State private var userSearch: String = ""
    @State private var isLoading = true
    
    var body: some View {
        LoadingView(isShowing: $isLoading) {
            NavigationView {
                VStack {
                    HStack {
                        Spacer()
                        TextField("Search...", text: self.$userSearch)
                            .padding(.leading, 12)
                        Button(action: {
                            self.userSearch = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                        Image(systemName: "magnifyingglass.circle")
                            .foregroundColor(Color(red: 0.273, green: 0.455, blue: 0.303))
                            .padding(.trailing, 12)
                        Spacer()
                    }
                    List {
                        if self.filterUsers().count == 0 {
                            Text("List is empty.").font(.largeTitle).multilineTextAlignment(.center)
                        } else {
                            ForEach(self.filterUsers()) { user in
                                NavigationLink(destination: UserPostsView(userId: user.id, userName: user.name)) {
                                    UserRow(user: user)
                                }
                            }
                        }
                    }.body
                        .onAppear(perform: self.loadData)
                    .navigationBarTitle("Users")
                }
            }
        }
    }
    
    func loadData() {
        DataRequest.loadUsers { users in
            self.isLoading = false
            guard let receivedUsers = users else {
                return
            }
            self.users = receivedUsers
        }
    }
    
    func filterUsers() -> [User] {
        guard userSearch != "" else {
            return self.users
        }
        return self.users.filter{ $0.name.contains($userSearch.wrappedValue) }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
