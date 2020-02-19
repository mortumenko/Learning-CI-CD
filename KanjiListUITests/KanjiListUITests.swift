/// Copyright (c) 2020 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import XCTest

class KanjiListUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
                
                                
        //snapshot("TheScreenName")
        
//4) Add `snapshot("01LoginScreen")` to wherever you want to create the screenshots

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}

/*
 Setting Up snapshot
  + 1. Create a new UI Test target in your Xcode project (See the top part of this article)
  + 2. Run fastlane snapshot init in your project folder
  + 3. Add the ./SnapshotHelper.swift file to your UI Test target (You can move the file anywhere you want)
  + 4. Add a new Xcode scheme for the newly created UI Test target
  + 5. Edit the scheme
  + 6. In the list on the left click "Build", and enable the checkbox under the "Run" column for your target.
  + 7. Enable the Shared box of the newly created scheme
8. (Objective C only) Add the bridging header to your test class.
 #import "MYUITests-Swift.h"
 The bridging header is named after your test target with -Swift.h appended.
9. In your UI Test class, click the Record button on the bottom left and record your interaction
10. To take a screenshot, call the following between interactions
 Swift: snapshot("01LoginScreen")
 Objective C: [Snapshot snapshot:@"01LoginScreen" timeWaitingForIdle:10];
  + 11. Add the following code to your setUp() method:
  + 12. In the terminal run fastlane snapshot.
 */
