import Foundation
import UIKit

extension MyViewController {
    /// コンテナ幅いっぱい・高さ44ptのアイテムを縦に並べるレイアウトを返します。
    ///
    /// セクション、グループ、アイテムの順にレイアウトを組み立てます。
    func makeCollectionViewLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(44)
        )
        
        // アイテム（NSCollectionLayoutItem）
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(44)
        )
        
        // グループ（NSCollectionLayoutGroup）
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )
       
        // セクション（NSCollectionLayoutSection）
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}
