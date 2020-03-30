//
//  UserStoreTest.swift
//  SocialNetworkTests
//
//  Created by Luis Ramirez on 29/03/20.
//  Copyright © 2020 Lramirez. All rights reserved.
//

import XCTest
import RealmSwift
@testable import SocialNetwork

class UserStoreTest: XCTestCase {
    
    let userStore = UserStore()

    override func setUp() {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
            
        let realm = try! Realm()
        userStore.realm = realm
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRetrieveUser() {
        let userId = 1
        guard let userRetrieved = try? userStore.retrieveUsers().filter(NSPredicate(format: "id = %i", userId)) else {
            XCTAssert(false, "Did not an user.")
            return
        }
        
        XCTAssert(userId == userRetrieved.first?.id, "Wrong object retrieved from the database.")
    }
    
    

}
