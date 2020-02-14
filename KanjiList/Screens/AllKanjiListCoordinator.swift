/// Copyright (c) 2020 Razeware LLC
/// 


import UIKit

class AllKanjiListCoordinator: Coordinator {
    
    let presenter: UINavigationController  // 1
    private let allKanjiList: [Kanji]  // 2
    private let kanjiStorage: KanjiStorage // 4

    // OS: all info that knows only current VC can't be passed directily from one VC to another, but can into initialization of specific coordinator
    init(presenter: UINavigationController, kanjiStorage: KanjiStorage) {
        self.presenter = presenter
        self.kanjiStorage = kanjiStorage
        allKanjiList = kanjiStorage.allKanji()  // 5
    }
    
    deinit {
        print("⚠️ Deinit \(self)")
    }

    func start() {
        let kanjiListViewController = KanjiListViewController(nibName: nil, bundle: nil) // 6
        kanjiListViewController.title = "Kanji list"
        kanjiListViewController.kanjiList = allKanjiList
        presenter.pushViewController(kanjiListViewController, animated: true)  // 7

        kanjiListViewController.currentCoordinator = self
        kanjiListViewController.delegate = self
    }
}


// MARK: - KanjiListViewControllerDelegate
extension AllKanjiListCoordinator: KanjiListViewControllerDelegate {
    
    func kanjiListViewControllerDidSelectKanji(_ selectedKanji: Kanji) {
        print("kanjiListViewControllerDidSelectKanji: \(selectedKanji.character)")
        
        let kanjiDetailCoordinator = KanjiDetailCoordinator(presenter: presenter,
                                                            kanji: selectedKanji,
                                                            kanjiStorage: kanjiStorage)
        kanjiDetailCoordinator.start()
    }
}
