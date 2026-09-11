import Foundation
import UIKit

extension MyViewController {
    /// 300×150ptのアイテムを、グループ単位で中央に揃えて横スクロールするレイアウトを返します。
    ///
    /// 1つのセクションに、アイテムを1つ含むグループを配置します。
    func makeCollectionViewLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(300),
            heightDimension: .absolute(150)
        )
        
        // アイテム（NSCollectionLayoutItem）
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(300),
            heightDimension: .absolute(150)
        )
        
        // グループ（NSCollectionLayoutGroup）
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
       
        // セクション（NSCollectionLayoutSection）
        let section = NSCollectionLayoutSection(group: group)
        // section.orthogonalScrollingBehavior = .continuous
        section.orthogonalScrollingBehavior = .groupPagingCentered

        return UICollectionViewCompositionalLayout(section: section)
    }
}
