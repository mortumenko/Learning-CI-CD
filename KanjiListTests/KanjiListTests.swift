/// Copyright (c) 2020 Razeware LLC
/// 


import XCTest
@testable import KanjiList

class KanjiListTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
/*
    func testFailured() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(3 == 2, "❌ Everything is bad")
    }*/

    func testPassed() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(5 == 5, "❌ Everything is bad")
    }
    // very tiny changes for creating test PR for Danger
    
    func testStorageFirstKanji() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let storage = KanjiStorage()
        let allKanji = storage.allKanji()
        let next = storage.kanjiForWord(allKanji.first?.examples[0].word ?? "")
        
        XCTAssert(next.count > 0, "❌ Everything is bad")
    }
    
    func testStorage() {
        let storage = KanjiStorage()
        let howMany = storage.allKanji().count
        XCTAssert(howMany > 0, "❌ KanjiStorage doesn't provide Kanjis")
    }
}
