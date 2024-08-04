//
//  ViewController.swift
//  chapter06
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
        
        collectionView = .init(
            frame: .zero,
            collectionViewLayout: makeMyCollectionViewLayout()
        )
        collectionView.delegate = self
    
        dataSource = makeDataSource(
            for: collectionView,
            repository: repository
        )
        
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

extension MyViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("✅ select at indexPath.section: \(indexPath.section)")
        print("✅ select at indexPath.item: \(indexPath.item)")
        print("✅ select at dataSource.itemIdentifier: \(String(describing: dataSource.itemIdentifier(for: indexPath)))")
    }
}
