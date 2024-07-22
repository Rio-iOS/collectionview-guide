//
//  MyCollectionViewLayout.swift
//  chapter02
//
//  Created by 藤門莉生 on 2024/07/22.
//

import Foundation
import UIKit

extension MyViewController {
    /// 高さ44ptで横幅が画面いっぱいのアイテムを縦に並べる
    /// Section > Group > Item
    /// セクションは複数指定できる
    /// グループは入れ子にしたり、複数のアイテムを含めたりして柔軟なレイアウトを作れる
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
