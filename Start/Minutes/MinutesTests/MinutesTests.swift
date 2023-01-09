//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by Apple on 08/01/23.
//  Copyright © 2023 Microsoft. All rights reserved.
//

import XCTest
@testable import Minutes

class MinutesTests: XCTestCase {
    
    var entryUnderTest: Entry!
    override func setUpWithError() throws {
        entryUnderTest = Entry("Title", "Content")
        
    }

    override func tearDownWithError() throws {
        entryUnderTest = nil
    }

    func testSerialization() {
        let serializeddata = FileEntryStore.serialize(entryUnderTest)
        let entry = FileEntryStore.deserialize(serializeddata!)
        
        XCTAssertEqual(entry?.title, "Title", "Title does not match")
        XCTAssertEqual(entry?.content, "Content", "Content does not match")
    }
}
