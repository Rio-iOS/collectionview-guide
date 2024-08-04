//
//  MyCollectionViewDataSource.swift
//  chapter04
//
//  Created by 藤門莉生 on 2024/08/04.
//

import Foundation
import UIKit

class MyCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    private weak var repository: MyItemRepository!
    
    init(repository: MyItemRepository!) {
        self.repository = repository
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        repository.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = repository.item(at: indexPath.item)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.reuseIdentifier, for: indexPath)
        
        if let cell = cell as? MyCollectionViewCell {
            cell.name = item.name
        }
        
        return cell
    }
}
