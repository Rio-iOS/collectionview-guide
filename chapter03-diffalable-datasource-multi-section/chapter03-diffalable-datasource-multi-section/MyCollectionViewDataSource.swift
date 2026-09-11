import Foundation
import UIKit

extension MyViewController {
    func makeDataSource(
        for collectionView: UICollectionView,
        repository: MyItemRepository
    ) -> UICollectionViewDiffableDataSource<MySection, MyItem.ID> {
        let cellRegistration = UICollectionView.CellRegistration<MyCollectionViewCell, MyItem> {
            cell, indexPath, item in
            cell.name = item.name
        }
        
        return UICollectionViewDiffableDataSource<MySection, MyItem.ID>(collectionView: collectionView) {
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
