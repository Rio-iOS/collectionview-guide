//
//  ViewController.swift
//  chapter04-mutil-cell
//
//  Created by 藤門莉生 on 2024/08/04.
//

import UIKit

class MyViewController: UIViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<MySection, MyItem.ID>
    typealias Snapshot = NSDiffableDataSourceSnapshot<MySection, MyItem.ID>
    
    private let repository = MyItemRepository()
    private var collectionView: UICollectionView!
    private var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: makeCollectinViewLayout()
        )
    
        dataSource = makeDataSource(
            for: collectionView,
            repository: repository
        )
        
        collectionView.dataSource = dataSource
        
        applySnapshot()
        
        view = collectionView
    }
    
    private func applySnapshot() {
        var snapshot = Snapshot()
        let sections = repository.sections()
        snapshot.appendSections(sections)
        sections.forEach { section in
            snapshot.appendItems(repository.ids(in: section), toSection: section)
        }
        dataSource.apply(snapshot)
    }
}

