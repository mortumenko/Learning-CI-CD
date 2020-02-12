/// Copyright (c) 2020 Razeware LLC
/// 

import UIKit


// Extras: Coordinator Pattern with Storyboards
// https://www.raywenderlich.com/158-coordinator-tutorial-for-ios-getting-started#toc-anchor-004

protocol StoryboardInstantiable: NSObjectProtocol {
  associatedtype MyType  // 1
  static var defaultFileName: String { get }  // 2
  static func instantiateViewController(_ bundle: Bundle?) -> MyType // 3
}

// RW: With it, you can just conform any UIViewController to StoryboardInstantiable, and you will be able to instantiate it.
// To use this extension, you need to create a separate storyboard for each UIViewController. The name of the storyboard must match the name of the UIViewController‘s class. This UIViewController must be set as the initial UIViewController for this storyboard.
extension StoryboardInstantiable where Self: UIViewController {
  static var defaultFileName: String {
    return NSStringFromClass(Self.self).components(separatedBy: ".").last!
  }

  static func instantiateViewController(_ bundle: Bundle? = nil) -> Self {
    let fileName = defaultFileName
    let sb = UIStoryboard(name: fileName, bundle: bundle)
    return sb.instantiateInitialViewController() as! Self
  }
}
