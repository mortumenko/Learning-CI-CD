/// Copyright (c) 2020 Razeware LLC
/// 


import UIKit

class KanjiDetailCoordinator: Coordinator {
  private let presenter: UINavigationController  // 1
    
    
// Extras: Coordinator Pattern with Storyboards
    //let viewController = KanjiDetailViewController.instantiateViewController()

    #warning("OS: why do we need strong reference ? This leads to additional +1 counted reference (p.6 in OS_README.md)")
  //private var kanjiDetailViewController: KanjiDetailViewController? // 2
    // OS: seems like is not used
    private var wordKanjiListViewController: KanjiListViewController? // 3
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
        print("Deinit \(self)")
    }
    
  func start() {
    let kanjiDetailViewController = KanjiDetailViewController(nibName: nil, bundle: nil) // 7
    kanjiDetailViewController.title = "Kanji details"
    kanjiDetailViewController.selectedKanji = kanji

    presenter.pushViewController(kanjiDetailViewController, animated: true) // 8
    //self.kanjiDetailViewController = kanjiDetailViewController
    kanjiDetailViewController.delegate = self
  }

}


// MARK: - KanjiDetailViewControllerDelegate
extension KanjiDetailCoordinator: KanjiDetailViewControllerDelegate {
  func kanjiDetailViewControllerDidSelectWord(_ word: String) {
    
    // Commented code it is approach for last VC in user flow , but I implemented transition to the reused KanjiListViewController via Coordinator
/*
    let wordKanjiListViewController = KanjiListViewController(nibName: nil, bundle: nil)
    let kanjiForWord = kanjiStorage.kanjiForWord(word)
    wordKanjiListViewController.kanjiList = kanjiForWord
    wordKanjiListViewController.title = word
    wordKanjiListViewController.cellAccessoryType = .none

    presenter.pushViewController(wordKanjiListViewController, animated: true)
*/
    
    print("KanjiDetailCoordinator as delegate will call new specific coordinator for list")
    let reusedListVCCoord = WordBasedKanjiListCoordinator(presenter: presenter, theKanji: word, kanjiStorage: kanjiStorage)
    
    reusedListVCCoord.start()
    
    //OS: see p.5 about strong reference in OS_README.md
    //self.reusedListVCCoordinator = reusedListVCCoord
  }
}
