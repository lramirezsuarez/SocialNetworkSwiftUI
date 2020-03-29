//
//  PersistenceImplementation.swift
//  SocialNetwork
//
//  Created by Luis Ramirez on 29/03/20.
//  Copyright © 2020 Lramirez. All rights reserved.
//

import Foundation
import RealmSwift

final class UserStore {
    var realm: Realm = try! Realm()
    
    public func saveUser(_ user: UserObject) {
        try! realm.write {
            realm.add(user)
        }
    }
    
    public func retrieveUsers() -> Results<UserObject> {
        return realm.objects(UserObject.self)
    }
}
