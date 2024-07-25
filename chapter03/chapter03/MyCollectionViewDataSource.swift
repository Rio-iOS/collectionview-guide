//
//  MyCollectionViewDataSource.swift
//  chapter03
//
//  Created by 藤門莉生 on 2024/07/25.
//

import Foundation
import UIKit

class MyCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    private weak var repository: MyItemRepository!
    
    init(repository: MyItemRepository!) {
        self.repository = repository
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        repository.numberOfItems(inSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = repository.item(at: indexPath)
        return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
    }
   
    // 複数のセクションを扱う
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        repository.numberOfSections()
    }
    
    private let cellRegistration = UICollectionView.CellRegistration<MyCollectionViewCell, MyItem> { cell, indexPath, item in
        cell.name = item.name
    }
}
