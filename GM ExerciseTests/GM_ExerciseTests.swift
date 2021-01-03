//
//  GM_ExerciseTests.swift
//  GM ExerciseTests
//
//  Created by Dhruval Patel on 1/2/21.
//

import XCTest
@testable import GM_Exercise

class GM_ExerciseTests: XCTestCase {
    
    var vcHelper: VCHelper!
    var commitList: [CommitModel]!
    
    override func setUpWithError() throws {
        vcHelper = VCHelper()
        commitList = [CommitModel]()
    }

    override func tearDownWithError() throws {
        vcHelper = nil
        commitList = nil
    }

    func testCheckForReachability() throws {
        
        let expectation = self.expectation(description: "Commit List With Updated Data")
        
        vcHelper.checkForReachability { [self] (isIntAvailable) in
            
            if isIntAvailable {
                
                commitList = vcHelper.commitList
                XCTAssertGreaterThan(commitList.count, 0, "CommitList is empty")
                XCTAssertNotEqual(commitList[0].author, "", "Error in parsing author name")
                XCTAssertNotEqual(commitList[0].commitSha, "", "Error in parsing commit hash")
                XCTAssertNotEqual(commitList[0].commitMessage, "", "Error in parsing commit message")
                
                expectation.fulfill()
                
            } else {
                
                XCTFail("No Internet Connection")
                
            }
        }
        
        waitForExpectations(timeout: 5)
    }

}
