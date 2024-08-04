//
//  ViewController.swift
//  chapter05-group-nest
//
//  Created by 藤門莉生 on 2024/08/04.
//

import UIKit

class MyViewController: UIViewController {
    private let repository = MyItemRepository()
    private var collectionView: UICollectionView!
    private var dataSource: MyCollectionViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

