//
//  ViewController.swift
//  chapter04-using-content-configuration
//
//  Created by 藤門莉生 on 2024/08/04.
//

import UIKit

class MyViewController: UIViewController {
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDataSource!
    private let repository = MyItemRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: makeCollectionViewLayout()
        )
        
        dataSource = MyCollectionViewDataSource(repository: repository)
        
        collectionView.dataSource = dataSource
        
        collectionView.reloadData()
        
        view = collectionView
    }


}

