//
//  MyCollectionViewLayout.swift
//  chapter05
//
//  Created by 藤門莉生 on 2024/08/04.
//

import Foundation
import UIKit

// UICollectionViewでは、全体をセクションという単位で分割できる。
// 全体でいくつかのセクションがあるかを把握するのは、DataSourceの役割である。
// Layoutの役割は、セクションのレイアウトを決めることである。
// Layoutではそれぞれのセクションに対して。一対一でレイアウトを指定する必要はない。
// セクションのレイアウトは、UICollectionViewCompositionalLayoutの
// イニシャライザに渡すことで指定する。
extension MyViewController {
    func makeCollectionViewLayout() -> UICollectionViewLayout {
        // 全体でいくつのアイテムがあるかを把握するのは DataSourceの役割
        // アイテムの具体的な表示をするのはCellの役割
        // Layoutの役割は、アイテムのレイアウトを決めること
        // アイテムのレイアウトでは、サイズが重要である。
        // サイズは、NSCollectionLayoutSizeで指定
        // サイズ指定では、widthDimensionとheightDimensionの2つの値を指定
        // どちらもNSCollectionLayoutDimension型の値
        // NSCollectionLayoutDimension型は次のような値をとる
        // - absolute(_: CGFloat)
        // - estimated(_: CGFloat)
        // - fractionalWidth(_: CGFloat)
        // - fractionalHeight(_: CGFloat)
        // absoluteとestimatedはサイズのpt値を指定
        // absoluteの場合は、指定した値がそのまま固定値として使われる
        // estimatedの場合は、指定した値が使われるが、後でサイズが変わる可能性がある。
        // 例えば、コンテンツの変更やフォントサイズの変更などのタイミングで実際の値に変更される
        // なお、後で実際の値に変更されるといっても、
        // 初期値は初期状態として想定するサイズを指定しておくのが望ましいである。
        // 実際の値とかけ離れた値を指定していると、
        // レイアウトが崩れる可能性がある。
        // fractionalWidthはアイテムのコンテナの幅に対する割合
        // fractionalHeightはアイテムのコンテナの高さに対する割合
        // fractionalWidth(1.0)は、コンテナの幅に対して100%
        // .fractionalWidhtと.fractionalHeightで正方形にする
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.25),
            heightDimension: .fractionalHeight(0.25)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
       
        // セクションとアイテムの間に入るのがグループである。
        // セクションやアイテムがUICollectionViewの
        // セクションやアイテムの概念と直接対応するのに対して、
        // グループはレイアウト専用の概念である。
        // これが、UICollectionViewCompositionalLayoutの特徴の一つ
        // グループは本来、複数のものを一つにまとめるという役割なので、
        // グループ自体にはあまり意味がない。
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.25)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 4
        )
        
        let section = NSCollectionLayoutSection(group: group)
      
        // イニシャライザは大きく分けて二つある。
        // 1. NSCollectionLayoutSectionを渡すもの
        // 全てのセクションに同じレイアウトを適用したい場合は、こちらを使うとシンプルである。
        // let layout = UICollectionViewCompositionalLayout(section: section)
      
        // 2. sectionProvider クロージャを渡すもの
        // セクションに応じて異なるレイアウトを指定したい場合は、こちらを使う。
        // sectionProviderクロージャにsectionIndexが渡されるため、
        // それに応じて返すNSCollectionLayoutSectionを変えることができる。
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
        return layout
    }
}
