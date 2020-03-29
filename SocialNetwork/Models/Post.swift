//
//  Post.swift
//  SocialNetwork
//
//  Created by Luis Ramirez on 26/03/20.
//  Copyright © 2020 Lramirez. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - Post
struct Post: Codable, Identifiable {
    let id: Int
    let userID: Int
    let title: String
    let body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

// MARK: - PostObject
final class PostObject: Object {
    @objc dynamic var id = 0
    @objc dynamic var userID = 0
    @objc dynamic var title = ""
    @objc dynamic var body = ""
}

// MARK: - Persistence for the Post
extension Post: Persistable {
    public init(managedObject: PostObject) {
        id = managedObject.id
        userID = managedObject.userID
        title = managedObject.title
        body = managedObject.body
    }
    
    public func managedObject() -> PostObject {
        let postObject = PostObject()
        postObject.id = id
        postObject.userID = userID
        postObject.title = title
        postObject.body = body
        
        return postObject
    }
}
