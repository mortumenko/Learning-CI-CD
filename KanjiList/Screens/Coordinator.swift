/// Copyright (c) 2020 Razeware LLC
/// 


/*
 Coordinators create, present and dismiss UIViewControllers while keeping the UIViewControllers separate and independent.
 Similar to how UIViewControllers manage UIViews, Coordinators manage UIViewControllers.
 */
import UIKit

protocol Coordinator {
    var presenter: UINavigationController { get }
    //OS: method for creation VC, set data (for datasource) into VC, title, additional properties and performing navigation
    func start()
}


protocol CoordinatedController {
    // OS: can be omitted if we will use delegate for VCs' protocol with strong reference. But protocol is optional feature, not every VC need to have delegate
    var currentCoordinator: Coordinator? { get set }
}

