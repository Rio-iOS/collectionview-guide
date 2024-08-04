//
//  MyCollectionViewLayout.swift
//  chapter04-mutil-cell
//
//  Created by 藤門莉生 on 2024/08/04.
//

import Foundation
import UIKit

extension MyViewController {
    func makeCollectinViewLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(44.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(44.0)
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let secton = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: secton)
    }
}
