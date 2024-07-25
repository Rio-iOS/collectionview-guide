//
//  MyCollectionViewLayout.swift
//  chapter02-horizontal
//
//  Created by 藤門莉生 on 2024/07/22.
//

import Foundation
import UIKit

extension MyViewController {
    /// 高さ44ptで横幅が画面いっぱいのアイテムを横に並べる
    /// Section > Group > Item
    /// セクションは複数指定できる
    /// グループは入れ子にしたり、複数のアイテムを含めたりして柔軟なレイアウトを作れる
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
