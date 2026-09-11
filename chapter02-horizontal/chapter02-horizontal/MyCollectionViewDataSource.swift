import Foundation
import UIKit

// UICollectionViewDataSource: UICollectionViewに表示する内容を指定するためのプロトコル
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
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = repository.item(at: indexPath.item)
        return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
    }
   
    // セルの登録
    private let cellRegistration = UICollectionView.CellRegistration<MyCollectionViewCell, MyItem> { cell, indexPath, item in
        cell.name = item.name
    }
}
