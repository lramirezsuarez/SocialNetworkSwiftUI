//
//  PersistenceImplementation.swift
//  SocialNetwork
//
//  Created by Luis Ramirez on 29/03/20.
//  Copyright © 2020 Lramirez. All rights reserved.
//

import Foundation
import RealmSwift

enum RuntimeError: Error {
    case NoRealmSet
}

final class UserStore {
    var realm: Realm?
    
    public func saveUser(_ user: UserObject) throws {
        if realm != nil {
            try! realm!.write {
                realm!.add(user)
            }
        } else {
            RuntimeError.NoRealmSet
        }
        
    }
    
    public func saveUsers(_ users: [User]) {
        do {
            try users.forEach({ user in
                do {
                    try saveUser(user.managedObject())
                } catch RuntimeError.NoRealmSet {
                    print(RuntimeError.NoRealmSet.localizedDescription)
                }
            })
        } catch {
            print("Unexpected error")
        }
    }
    
    public func retrieveUsers() throws -> Results<UserObject> {
        if realm != nil {
            return realm!.objects(UserObject.self)
        } else {
            throw RuntimeError.NoRealmSet
        }
        
    }
}
