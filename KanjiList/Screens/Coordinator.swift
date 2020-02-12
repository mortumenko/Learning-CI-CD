/// Copyright (c) 2020 Razeware LLC
/// 


import Foundation

/*
 Coordinators create, present and dismiss UIViewControllers while keeping the UIViewControllers separate and independent.
 Similar to how UIViewControllers manage UIViews, Coordinators manage UIViewControllers.
 */


protocol Coordinator {
    //OS: method for creation VC, set data (for datasource) into VC, title, additional properties and performing navigation
  func start()
}
