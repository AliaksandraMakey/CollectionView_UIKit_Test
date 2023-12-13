//
//  Test_CollectionView_UIKitTests.swift
//  Test_CollectionView_UIKitTests
//
//  Created by Александра Макей on 13.12.2023.
//

import XCTest

import XCTest
@testable import Test_CollectionView_UIKit

class NetworkServiceTests: XCTestCase {
    
    var networkService: NetworkService!
    
    override func setUp() {
        super.setUp()
        networkService = NetworkService()
    }
    
    override func tearDown() {
        networkService = nil
        super.tearDown()
    }
    
    func testFetchUsersSuccess() {
        let expectation = self.expectation(description: "Fetching users successfully")
        
        let networkService = NetworkService()
        networkService.fetchUsers { (users, error) in
            if let users = users {
                XCTAssertFalse(users.isEmpty, "Users list is empty")
                expectation.fulfill()
            } else {
                XCTFail("Failed to fetch users or users list is nil")
            }
        }
        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("waitForExpectations error: \(error)")
            }
        }
    }
}
