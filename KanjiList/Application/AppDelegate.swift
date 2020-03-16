/// Copyright (c) 2018 Razeware LLC
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

import UIKit

// https://www.raywenderlich.com/158-coordinator-tutorial-for-ios-getting-started

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  private var applicationCoordinator: ApplicationCoordinator?  // 1
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions:
                     [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    let applicationCoordinator = ApplicationCoordinator(window: window) // 2
    
    self.window = window
    self.applicationCoordinator = applicationCoordinator
    
    applicationCoordinator.start()  // 3
    return true
  }
}


/*
 Setting Up snapshot
  + 1. Create a new UI Test target in your Xcode project (See the top part of this article)
  + 2. Run fastlane snapshot init in your project folder
  + 3. Add the ./SnapshotHelper.swift file to your UI Test target (You can move the file anywhere you want)
  + 4. Add a new Xcode scheme for the newly created UI Test target
  + 5. Edit the scheme (of main target)
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


/*
 Setting Up snapshot
  + 1. Create a new UI Test target in your Xcode project (See the top part of this article)
  + 2. Run fastlane snapshot init in your project folder
  + 3. Add the ./SnapshotHelper.swift file to your UI Test target (You can move the file anywhere you want)
  + 4. Add a new Xcode scheme for the newly created UI Test target
  + 5. Edit the scheme (of main target)
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



/*
 Setting Up snapshot
  + 1. Create a new UI Test target in your Xcode project (See the top part of this article)
  + 2. Run fastlane snapshot init in your project folder
  + 3. Add the ./SnapshotHelper.swift file to your UI Test target (You can move the file anywhere you want)
  + 4. Add a new Xcode scheme for the newly created UI Test target
  + 5. Edit the scheme (of main target)
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

