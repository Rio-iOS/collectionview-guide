//
//  MyCollectionViewLayout.swift
//  chapter06
//
//  Created by 藤門莉生 on 2024/08/04.
//

import Foundation
import UIKit

extension MyViewController {
    func makeMyCollectionViewLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(44)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(44)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
       
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
            configuration.headerMode = .supplementary
            let listSection = NSCollectionLayoutSection.list(
                using: configuration,
                layoutEnvironment: layoutEnvironment
            )
            
            // orthogonalScrollingBehaviorプロパティは、
            // セクションのスクロール動作を設定します。
            // デフォルトでは、コレクションビュー全体が垂直または水平にスクロールするが、
            // このプロパティを使用すると、
            // 個々のセクションがコレクションビューのスクロール方向と
            // 直交する方向にスクロールするように設定できる。
            // 例えば、垂直スクロールのコレクションビュー内に
            // 水平スクロールのセクションを作成することができる。
            // 利用できる値は以下
            // .none - 直交スクロールはなし。
            // .continuous - スクロールが滑らかに続く。
            // .continuousGroupLeadingBoundary - グループの先頭に揃ってスクロールする。
            // .paging - ページングスクロール。
            // .groupPaging - グループ単位でページングスクロール。
            // .groupPagingCentered - グループ単位で中央揃えのページングスクロール。
            section.orthogonalScrollingBehavior = listSection.orthogonalScrollingBehavior
            
            // boundarySupplementaryItemsプロパティは、
            // セクションの境界（上部または下部）に表示する
            // 補助アイテム（サプリメンタリーアイテム）を設定します。
            // これには、ヘッダーやフッターなどが含まれる。
            section.boundarySupplementaryItems = listSection.boundarySupplementaryItems
            
            return section
        }
        return layout
    }
}
