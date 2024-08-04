//
//  MyCollectionViewDataSource.swift
//  chapter04-mutil-cell
//
//  Created by 藤門莉生 on 2024/08/04.
//

import Foundation
import UIKit

extension MyViewController {
    func makeDataSource(
        for collectionView: UICollectionView,
        repository: MyItemRepository
    ) -> UICollectionViewDiffableDataSource<MySection, MyItem.ID> {
        let mainCellRegistration = UICollectionView.CellRegistration<UICollectionViewCell, MyItem> { cell, indexPath, item in
            cell.contentConfiguration = MyContentConfiguration(name: item.name)
        }
        
        let secondaryCellRegistration = UICollectionView.CellRegistration<UICollectionViewCell, MyItem> { cell, indexPath, item in
            cell.contentConfiguration = MyContentConfiguration(name: item.name)
        }
        
        return UICollectionViewDiffableDataSource<MySection, MyItem.ID>(
            collectionView: collectionView) {
                [weak repository]
                collectionView,
                indexPath,
                id in
                let item = repository?.item(id: id)
                
                switch indexPath.section {
                case 0:
                    print("✅ section: main")
                    return collectionView.dequeueConfiguredReusableCell(
                        using: mainCellRegistration,
                        for: indexPath,
                        item: item
                    )
                    
                case 1:
                    print("✅ section: secondary")
                    return collectionView.dequeueConfiguredReusableCell(
                        using: secondaryCellRegistration,
                        for: indexPath,
                        item: item
                    )
                    
                default:
                    fatalError()
                }
            }
    }
}
