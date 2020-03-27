//
//  UserPostsView.swift
//  SocialNetwork
//
//  Created by Luis Ramirez on 26/03/20.
//  Copyright © 2020 Lramirez. All rights reserved.
//

import SwiftUI

struct UserPostsView: View {
    @State private var posts = [Post]()
    let userId: Int
    var userName: String
    
    var body: some View {
        List {
            if posts.count > 0 {
                ForEach(posts) { post in
                    PostRow(post: post)
                }
            } else {
                Text("No posts to shows".uppercased())
                    .font(.title)
                    .multilineTextAlignment(.center)
            }
            
        }.onAppear(perform: loadPosts)
        .navigationBarTitle(userName)
    }
    
    func loadPosts() {
        DataRequest.loadUserPosts(with: userId) { posts in
            guard let userPosts = posts else {
                return
            }
            self.posts = userPosts
        }
    }
}

struct UserPostsView_Previews: PreviewProvider {
    static var previews: some View {
        UserPostsView(userId: 1, userName: "Lucho")
    }
}
