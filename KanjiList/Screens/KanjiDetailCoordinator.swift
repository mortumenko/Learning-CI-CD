/// Copyright (c) 2020 Razeware LLC
/// 


import UIKit

class KanjiDetailCoordinator: Coordinator {
    
// Extras: Coordinator Pattern with Storyboards
    //let viewController = KanjiDetailViewController.instantiateViewController()
    
    
    private let presenter: UINavigationController  // 1
    private let kanjiStorage: KanjiStorage  // 4
    private let kanji: Kanji  // 5

    
    init(presenter: UINavigationController, // 6
       kanji: Kanji,
       kanjiStorage: KanjiStorage) {

        self.kanji = kanji
        self.presenter = presenter
        self.kanjiStorage = kanjiStorage
    }

    deinit {
        print("⚠️ Deinit \(self)")
    }
    
    func start() {
        let kanjiDetailViewController = KanjiDetailViewController(nibName: nil, bundle: nil) // 7
        kanjiDetailViewController.title = "Kanji details"
        kanjiDetailViewController.selectedKanji = kanji

        presenter.pushViewController(kanjiDetailViewController, animated: true) // 8
        kanjiDetailViewController.currentCoordinator = self
        kanjiDetailViewController.delegate = self
    }
    
}


// MARK: - KanjiDetailViewControllerDelegate
extension KanjiDetailCoordinator: KanjiDetailViewControllerDelegate {
  func kanjiDetailViewControllerDidSelectWord(_ word: String) {

    print("KanjiDetailCoordinator as delegate will call new specific coordinator for list")
    let reusedListVCCoord = WordBasedKanjiListCoordinator(presenter: presenter, theKanji: word, kanjiStorage: kanjiStorage)
    
    reusedListVCCoord.start()
  }
}
