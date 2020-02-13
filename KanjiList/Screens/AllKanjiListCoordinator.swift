/// Copyright (c) 2020 Razeware LLC
/// 


import UIKit

class AllKanjiListCoordinator: Coordinator {
    
    private let presenter: UINavigationController  // 1
    private let allKanjiList: [Kanji]  // 2
    #warning("OS: why do we need strong reference ? This leads to additional +1 counted reference (p.6 in OS_README.md)")
    private var kanjiListViewController: KanjiListViewController? // 3
    private let kanjiStorage: KanjiStorage // 4
    private var kanjiDetailCoordinator: KanjiDetailCoordinator?

    // OS: all info that knows only current VC can't be passed directily from one VC to another, but can into initialization of specific coordinator
    init(presenter: UINavigationController, kanjiStorage: KanjiStorage) {
        self.presenter = presenter
        self.kanjiStorage = kanjiStorage
        allKanjiList = kanjiStorage.allKanji()  // 5
    }
    
    deinit {
        print("Deinit \(self)")
    }

    func start() {
        let kanjiListViewController = KanjiListViewController(nibName: nil, bundle: nil) // 6
        kanjiListViewController.title = "Kanji list"
        kanjiListViewController.kanjiList = allKanjiList
        presenter.pushViewController(kanjiListViewController, animated: true)  // 7

        self.kanjiListViewController = kanjiListViewController
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

        // OS: be awary that this Coordination is alive (see p.5 about strong reference in OS_README.md)
        self.kanjiDetailCoordinator = kanjiDetailCoordinator
    }
}
