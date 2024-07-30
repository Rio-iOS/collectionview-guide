//
//  MyCollectionViewDataSource.swift
//  chapter03-diffalable-datasource
//
//  Created by 藤門莉生 on 2024/07/26.
//

import Foundation
import UIKit

extension MyViewController {
    // UICollectionViewDiffableDataSourceはジェネリック型で、
    // セクションの識別子の型とアイテムの識別子の型を指定する。
    
    func makeDataSource(
        for collectionView: UICollectionView,
        repository: MyItemRepository
    ) -> UICollectionViewDiffableDataSource<Int, MyItem.ID> {
        let cellRegistration = UICollectionView.CellRegistration<MyCollectionViewCell, MyItem> { cell, indexPath, item in
            cell.name = item.name
        }
       
        // collectionViewとcellProviderクロージャを引数に取る。
        // cellProvideerクロージャは、UICollectionViewCellを返すもの。
        // これは、UICollectionViewDataSourceプロトコルのcollectionView(_:cellForItemAt:)メソッドの実装と同様である。
        // ただし、IndexPathの代わりにMyItem.IDを使ってアイテムを取得する。
        // UICollectionViewDataSourceプロトコルのcollectionView(_: cellForItemAt:)メソッドの実装と同様
        // collectionView(_:numberOfItemsInSection:)メソッドや
        // collectionView(_:cellForItemAt:)メソッドを直接実装する必要はなくなっている。
        // cellProvider クロージャの中でindexPathを使ってアイテムを取得するわけではない。
        // どの位置にどのアイテムがあるかという情報が、NSDiffableDataSourceSnapshotという形でまとめられている。
        // cellProviderが位置を意識する必要はない
        // UICollectionViewDataSourceのcollectionView(_:cellForItemAt:)メソッドでは
        // 位置をもとにアイテムを取得しているのとは異なっている。
        // スナップショットの仕組みによって、データの更新が扱いやすくなっている。
        return UICollectionViewDiffableDataSource<Int, MyItem.ID>(
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
    }
}
