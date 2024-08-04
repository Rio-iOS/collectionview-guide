//
//  MyCollectionViewDataSource.swift
//  chapter06
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
        let cellRegistration = UICollectionView.CellRegistration<MyCollectionViewCell, MyItem> { cell, indexPath, item in
            cell.name = item.name
        }
        
        let dataSource = UICollectionViewDiffableDataSource<MySection, MyItem.ID>(
            collectionView: collectionView) {
                [weak repository] collectionView,
                indexPath,
                id in
                let item = repository?.item(id: id)
                
                return collectionView.dequeueConfiguredReusableCell(
                    using: cellRegistration,
                    for: indexPath,
                    item: item
                )
            }
       
        // ヘッダーの設定
        let headerRegistration = UICollectionView.SupplementaryRegistration<UICollectionViewListCell>(elementKind: UICollectionView.elementKindSectionHeader) { view, elementKind, indexPath in
            var configuration = view.defaultContentConfiguration()
            configuration.text = "Section Header"
            view.contentConfiguration = configuration
        }
        
        dataSource.supplementaryViewProvider = {
            collectionView,
            elementKind,
            indexPath in
            return collectionView.dequeueConfiguredReusableSupplementary(
                using: headerRegistration,
                for: indexPath
            )
        }
        
        return dataSource
    }
}
