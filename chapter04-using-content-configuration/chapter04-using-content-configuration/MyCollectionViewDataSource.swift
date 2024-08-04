//
//  MyCollectionViewDataSource.swift
//  chapter04-using-content-configuration
//
//  Created by 藤門莉生 on 2024/08/04.
//

import Foundation
import UIKit

class MyCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    private weak var repository: MyItemRepository!
    private let cellRegistration = UICollectionView.CellRegistration<UICollectionViewCell, MyItem> { cell, indexPath, item in
        cell.contentConfiguration = MyContentConfiguration(name: item.name)
    }
    
    init(repository: MyItemRepository!) {
        self.repository = repository
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        repository.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = repository.item(at: indexPath.item)
     
        // セルの取り出し時にCellRegistrationを渡す
        // 直感的にやや理解しづらい
        let cell = collectionView.dequeueConfiguredReusableCell(
            using: cellRegistration,
            for: indexPath,
            item: item
        )
        
        return cell
    }
}
