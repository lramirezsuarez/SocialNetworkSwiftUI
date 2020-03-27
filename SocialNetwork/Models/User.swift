//
//  User.swift
//  SocialNetwork
//
//  Created by Luis Ramirez on 26/03/20.
//  Copyright © 2020 Lramirez. All rights reserved.
//

import Foundation

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let phone: String
}
