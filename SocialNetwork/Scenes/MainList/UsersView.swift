//
//  ContentView.swift
//  SocialNetwork
//
//  Created by Luis Ramirez on 26/03/20.
//  Copyright © 2020 Lramirez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    NavigationLink(destination: UserPostsView(userId: user.id)) {
                        UserRow(user: user)
                    }
                }
            }.onAppear(perform: loadData)
        }
    }
    
    func loadData() {
        DataRequest.loadUsers { users in
            guard let receivedUsers = users else {
                return
            }
            self.users = receivedUsers
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
