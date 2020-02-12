/// Copyright (c) 2020 Razeware LLC
/// 

import UIKit

class  WordBasedKanjiListCoordinator: Coordinator {
    
    private let presenter: UINavigationController  // 1
    private let kanjiWord: String
    private let chosenKanjiList: [Kanji]  // 2
    private let kanjiStorage: KanjiStorage // 4
    
    deinit {
        print("Deinit \(self)")
    }
    
    init(presenter: UINavigationController, theKanji: String, kanjiStorage: KanjiStorage) {
        
        self.presenter = presenter
        self.kanjiWord = theKanji
        self.kanjiStorage = kanjiStorage
        chosenKanjiList = kanjiStorage.allKanji()  // 5
    }

    
    func start() {
        print("WordBasedKanjiListCoordinator -> start")
        let kanjiForWord = kanjiStorage.kanjiForWord(kanjiWord)
        
        let wordKanjiListViewController = KanjiListViewController(nibName: nil, bundle: nil)
        wordKanjiListViewController.kanjiList = kanjiForWord
        wordKanjiListViewController.title = kanjiWord
        wordKanjiListViewController.cellAccessoryType = .none
        presenter.pushViewController(wordKanjiListViewController, animated: true)
    }
    
}
