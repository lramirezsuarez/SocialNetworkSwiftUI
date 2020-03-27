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
    
    var body: some View {
        List {
            ForEach(posts) { post in
                Text(post.body)
            }
        }.onAppear(perform: loadPosts)
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
        UserPostsView(userId: 1)
    }
}
