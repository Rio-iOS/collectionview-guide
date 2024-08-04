//
//  MyCollectionViewDataSource.swift
//  chapter04-using-cell-registration
//
//  Created by 藤門莉生 on 2024/08/04.
//

import Foundation
import UIKit

class MyCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    private weak var repository: MyItemRepository!
    // 以下の箇所では、CellRegistrationを生成してはいけない
    // - UICollectionViewDataSource の collectionView(_:cellForItemAt:)メソッドの中
    // - UICollectionViewDiffableDataSource の cellProviderクロージャの中（イニシャライザえ渡すクロージャ）
    // どちらも、セルの取り出し（dequeue）を行う箇所
    // この中で、CellRegistrationを生成する実装にすると、セルの登録や再利用ができない。
    // iOS15以降では、この誤りに対して、実行時に例外が発生する。
    // あらかじめ外側で CellRegistration を生成しておき、それをセルの取り出しで渡す
    private let cellRegistration = UICollectionView.CellRegistration<MyCollectionViewCell, MyItem> { cell, indexPath, item in
        cell.name = item.name
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
