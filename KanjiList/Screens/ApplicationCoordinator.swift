/// Copyright (c) 2020 Razeware LLC
/// 


import UIKit

class ApplicationCoordinator: Coordinator {
    
    private let kanjiStorage: KanjiStorage //  1
    private let window: UIWindow  // 2
    private let rootViewController: UINavigationController  // 3
    private let allKanjiListCoordinator: AllKanjiListCoordinator

  
  init(window: UIWindow) { //4
    self.window = window
    kanjiStorage = KanjiStorage()
    rootViewController = UINavigationController()
    rootViewController.navigationBar.prefersLargeTitles = true
    
    // Code below is for testing purposes   // 5
    allKanjiListCoordinator = AllKanjiListCoordinator(presenter: rootViewController, kanjiStorage: kanjiStorage)
  }
    
  // MARK: - Coordinator
    func start() {  // 6
        window.rootViewController = rootViewController
        allKanjiListCoordinator.start()
        window.makeKeyAndVisible()
    }
}
