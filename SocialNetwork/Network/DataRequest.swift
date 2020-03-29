//
//  DataRequest.swift
//  SocialNetwork
//
//  Created by Luis Ramirez on 26/03/20.
//  Copyright © 2020 Lramirez. All rights reserved.
//

import Foundation
import RealmSwift

protocol DataRequestProtocol {
    static func loadUsers(completion: @escaping (([User]?) -> Void))
    static func loadUserPosts(with userId: Int, completion: @escaping (([Post]?) -> Void))
}

struct DataRequest: DataRequestProtocol {

    static func loadUsers(completion: @escaping (([User]?) -> Void)) {
        loadUsersFromRealm { realmUsers in
            if let users = realmUsers, users.count > 0 {
                completion(users)
            } else {
                loadUsersFromNetwork { users in
                    guard let networkUsers = users else {
                        completion(nil)
                        return
                    }
                    
                    saveUsersToRealm(users: networkUsers)
                    completion(networkUsers)
                }
            }
        }
        
    }
    
    static func loadUserPosts(with userId: Int, completion: @escaping (([Post]?) -> Void)) {
        loadPostsFromNetwork(with: userId) { posts in
            guard let posts = posts else {
                completion(nil)
                return
            }
            completion(posts)
        }
    }
    
    static private func loadUsersFromRealm(completion: @escaping (([User]?) -> Void)) {
        let userStore = UserStore()
        let realmUsers = Array(userStore.retrieveUsers())
        let users = realmUsers.map { User(id: $0.id, name: $0.name, username: $0.username, email: $0.email, phone: $0.phone) }
        
        completion(users)
    }
    
    static private func saveUsersToRealm(users: [User]) {
        let userStore = UserStore()
        users.forEach({ user in
            userStore.saveUser(user.managedObject())
        })
    }
    
    static private func loadUsersFromNetwork(completion: @escaping (([User]?) -> Void)) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
        components.path = "/users"
        let jsonDecoder = JSONDecoder()
        
        guard let url = components.url,
            let timeoutInterval = TimeInterval(exactly: 300) else {
            preconditionFailure("Failed to construct URL")
        }
        let taskConfiguration = URLSessionConfiguration.default
        taskConfiguration.timeoutIntervalForRequest = timeoutInterval
        
        let urlSession = URLSession(configuration: taskConfiguration)
        let task = urlSession.dataTask(with: url) {
            data, response, error in
            
            DispatchQueue.main.async {
                if let data = data {
                    let usersDecoded = try? jsonDecoder.decode([User].self, from: data)
                    completion(usersDecoded)
                } else {
                    completion(nil)
                }
            }
        }
        
        task.resume()
    }
    
    static private func loadPostsFromNetwork(with userId: Int, completion: @escaping (([Post]?) -> Void)) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
        components.path = "/posts"
        components.query = "userId=\(userId)"
        let jsonDecoder = JSONDecoder()

        guard let url = components.url,
            let timeoutInterval = TimeInterval(exactly: 300) else {
            preconditionFailure("Failed to construct URL")
        }
        let taskConfiguration = URLSessionConfiguration.default
        taskConfiguration.timeoutIntervalForRequest = timeoutInterval

        let urlSession = URLSession(configuration: taskConfiguration)
        let task = urlSession.dataTask(with: url) {
            data, response, error in

            DispatchQueue.main.async {
                if let data = data {
                    let postsDecoded = try? jsonDecoder.decode([Post].self, from: data)
                    completion(postsDecoded)
                } else {
                    completion(nil)
                }
            }
        }

        task.resume()
    }
}
