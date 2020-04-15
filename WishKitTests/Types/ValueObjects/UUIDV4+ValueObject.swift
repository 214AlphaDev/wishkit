//
//  UUIDV4+ValueObject.swift
//  WishKitTests
//
//  Created by Andrii Selivanov on 3/27/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import XCTest
@testable import WishKit

class UUIDV4_ValueObject: XCTestCase {

    func assertNotPassingValidation(id: String) {
        if case .invalid(let error) = UUIDV4.validateID(id), case ValidationError.invalidUUIDV4String = error {
        } else {
            XCTFail("incorrect id \(id) passed validation")
        }
    }
    
    func assertPassingValidation(id: String) {
        if case .invalid(let error) = UUIDV4.validateID(id) {
            XCTFail(ErrorDescription.describe(error: error) ?? "Unknown error")
        }
    }
    
    func testIncorrectStringValidation() {
         assertNotPassingValidation(id: "some_incorrect_id")
    }
    
    func testIncorrectPositionsValidation() {
        // Invalid first group length
        assertNotPassingValidation(id: "088bccdb6-3e79-4469-9a67-60f97c592d91")
        // Invalid second group length
        assertNotPassingValidation(id: "88bccdb6-03e79-4469-9a67-60f97c592d91")
        // Invalid third group length
        assertNotPassingValidation(id: "88bccdb6-3e79-04469-9a67-60f97c592d91")
        // Invalid fourth group length
        assertNotPassingValidation(id: "88bccdb6-3e79-4469-09a67-60f97c592d91")
        // Invalid fifth group length
        assertNotPassingValidation(id: "88bccdb6-3e79-4469-9a67-060f97c592d91")
        // Invalid first character in third group (should be 4)
        assertNotPassingValidation(id: "88bccdb6-3e79-5469-9a67-60f97c592d91")
        // Invalid first group length
        assertNotPassingValidation(id: "88bccdb-3e79-4469-9a67-60f97c592d910")
        // Invalid first character in fourth group (should be 8,9, a or b)
        assertNotPassingValidation(id: "88bccdb0-3e79-4469-4a67-60f97c592d91")
        // Invalid last character in first group (should be a hex character)
        assertNotPassingValidation(id: "88bccdbt-3e79-4469-9a67-60f97c592d91")
        // Invalid two gyphens after first group
        assertNotPassingValidation(id: "88bccdb--3e79-4469-9a67-60f97c592d91")
    }
    
    func testValidIDValidation() {
        assertPassingValidation(id: "88bccdb6-3e79-4469-9a63-60f97c592d91")
        assertPassingValidation(id: "1016fc1b-6e88-49c8-8dce-0a5221578f26")
    }

}
