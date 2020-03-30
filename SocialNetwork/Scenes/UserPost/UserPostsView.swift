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
    @State private var isLoading = true
    let userId: Int
    var userName: String
    
    var body: some View {
        LoadingView(isShowing: $isLoading) {
            List {
                if self.posts.count > 0 {
                    ForEach(self.posts) { post in
                        PostRow(post: post)
                    }
                } else if !self.isLoading && self.posts.count == 0 {
                    Text("No posts to shows".uppercased())
                        .font(.title)
                        .multilineTextAlignment(.center)
                }
            }
            .onAppear(perform: self.loadPosts)
            .navigationBarTitle(self.userName)
            .listSeparatorStyleNone()
        }
    }
    
    func loadPosts() {
        DataRequest.loadUserPosts(with: userId) { posts in
            self.isLoading = false
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
