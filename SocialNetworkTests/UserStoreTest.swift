//
//  UserStoreTest.swift
//  SocialNetworkTests
//
//  Created by Luis Ramirez on 29/03/20.
//  Copyright © 2020 Lramirez. All rights reserved.
//

import XCTest
@testable import SocialNetwork

class UserStoreTest: XCTestCase {
    
    let userStore = UserStore()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRetrieveUser() {
        let userRetrieved = userStore.retrieveUsers().last
        
        XCTAssert(500 == userRetrieved?.id, "Wrong object retrieved from the database.")
    }
    
    

}
