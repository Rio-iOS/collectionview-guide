//
//  ViewController.swift
//  chapter03-diffalable-datasource-multi-section
//
//  Created by 藤門莉生 on 2024/07/30.
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
        view.backgroundColor = .systemBackground
        
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: makeCollectinViewLayout()
        )
        
        setupConstraints()
        
        dataSource = makeDataSource(
            for: collectionView,
            repository: repository
        )
        
        applySnapshot()
    }
    
    private func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension MyViewController {
    func applySnapshot() {
        var snapshot = Snapshot()
        let sections = repository.sections()
        snapshot.appendSections(sections)
        sections.forEach { section in
            snapshot.appendItems(repository.ids(in: section), toSection: section)
        }
        dataSource.apply(snapshot)
    }
}
