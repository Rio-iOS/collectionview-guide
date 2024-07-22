//
//  MyCollectionViewDataSource.swift
//  chapter02
//
//  Created by 藤門莉生 on 2024/07/22.
//

import Foundation
import UIKit

// UICollectionDataSource: UICollectionViewに表示する内容を指定するためのプロトコル
// プロトコルなので実装クラスを作る必要がある。
// 予め用意されている実装クラスであるUICollectionViewDiffableDataSourceを使うことができる。
class MyCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    private weak var repository: MyItemRepository!
    
    init(repository: MyItemRepository!) {
        self.repository = repository
        super.init()
    }
   
    // アイテム数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        repository.numberOfItems()
    }
   
    // データを表示するためのセルをUICollectionViewCell型で返す
    // パフォーマンス向上のために、セルは毎回新しく作るのではなく、
    // 一度作ったセルを再利用する。
    // セルの再利用のためには、セルをUICollectionViewに
    // 登録（register）しておき、
    // 再利用する時に取り出す（dequeue）する。
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = repository.item(at: indexPath.item)
        // dequeueConfiguredReusableCell(using:for:item:)メソッドを使う。
        // CellRegistrationで登録したセルを取り出すメソッド。
        // iOS13までは、セルの登録と取り出しにReuse Identifierという文字列を利用する必要があったが、この方法は間違いが起こりやすいため、できるだけCellRegistrationを使うことが推奨
        return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
    }
   
    // セルの登録のために、予めcellRegistrationという
    // プロパティにCellRegistrationを作っておく。
    private let cellRegistration = UICollectionView.CellRegistration<MyCollectionViewCell, MyItem> { cell, indexPath, item in
        cell.name = item.name
    }
}
