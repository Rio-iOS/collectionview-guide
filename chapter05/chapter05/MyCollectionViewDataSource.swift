//
//  MyCollectionViewDataSource.swift
//  chapter05
//
//  Created by 藤門莉生 on 2024/08/04.
//

import Foundation
import UIKit

class MyCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    private weak var repository: MyItemRepository!
    
    private let cellRegistration = UICollectionView.CellRegistration<MyCollectionViewCell, MyItem> { cell, indexPath, item in
        cell.name = item.name
    }

    init(repository: MyItemRepository) {
        self.repository = repository
        super.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        repository.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = repository.item(at: indexPath.item)
        
        return collectionView.dequeueConfiguredReusableCell(
            using: cellRegistration,
            for: indexPath,
            item: item
        )
    }
}
