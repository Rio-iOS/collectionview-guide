//
//  ViewController.swift
//  chapter03
//
//  Created by 藤門莉生 on 2024/07/25.
//

import UIKit

final class MyViewController: UIViewController {
    private let repository = MyItemRepository()
    private var collectionView: UICollectionView!
    private var dataSource: MyCollectionViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: makeCollectionViewLayout()
        )
        
        setupConstraints()
        
        dataSource = MyCollectionViewDataSource(repository: repository)
        
        collectionView.dataSource = dataSource
        collectionView.reloadData()
    }
}

private extension MyViewController {
    func setupConstraints() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
