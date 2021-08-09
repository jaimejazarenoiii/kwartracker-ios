//
//  UserProfileTests.swift
//  KwartrackerTests
//
//  Created by Mickale Saturre on 6/23/21.
//

import XCTest
@testable import Kwartracker

class UserProfileTests: XCTestCase {
    var state: UserProfileViewState!
    var mockAuthService: MockUserProfileServiceClient!
    
    override func setUp() {
        super.setUp()
        state = UserProfileViewState()
        mockAuthService = MockUserProfileServiceClient()
    }

    override func tearDown() {
        state = nil
        mockAuthService = nil
        super.tearDown()
    }
    
    func testSucessFetchingUserProfile() {
        mockAuthService.getProfile() { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
                XCTAssertNil(response.errors)
                
                guard let data = response.data?.profile else {
                    XCTAssert(false)
                    return
                }
                
                _ = userProfileReducer(
                    state: &self.state,
                    action: .setUserDetail(data),
                    environment: World()
                )

                break
            case .failure(let error):
                XCTAssertNil(error)
                break
            }
        }
    }
    
    func testFailedFetchingUserProfile() {
        mockAuthService.shouldErrorRequest = true
        
        _ = mockAuthService.getProfile() { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
                XCTAssertNil(response.data?.profile)
                XCTAssertNotNil(response.errors)
                
                
                guard let errorMessage = response.errors?.first?.errorDescription else {
                    XCTAssert(false)
                    return
                }
                
                _ = userProfileReducer(
                    state: &self.state,
                    action: .errorMessage(errorMessage),
                    environment: World()
                )
                
                XCTAssertNotNil(errorMessage)

                break
            case .failure(let error):
                XCTAssertNotNil(error)
                break
            }
        }
    }
}
