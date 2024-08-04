//
//  MyCollectionViewLayout.swift
//  chapter05-group-nest
//
//  Created by 藤門莉生 on 2024/08/04.
//

import Foundation
import UIKit

extension MyViewController {
    // ネストを使う場合は、fractinalWidthやfractionalHeightの指定が
    // 親グループに対する割合となることに注意する。
    // 考え方としては、一番外側のグループのサイズから考えていくと分かりやすい
    func makeCollectionViewLayout() -> UICollectionViewLayout {
        
        let itemSmall = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.5)
            )
        )
        
        let groupSmallPair = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1.0)
            ),
            repeatingSubitem: itemSmall,
            count: 2
        )
        
        let itemLarge = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        
        let groupLeftLarge = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.5)
            ),
            subitems: [itemLarge, groupSmallPair]
        )
        
        let groupRightLarge = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.5)
            ),
            subitems: [groupSmallPair, itemLarge]
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            ),
            subitems: [groupLeftLarge, groupRightLarge]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}
