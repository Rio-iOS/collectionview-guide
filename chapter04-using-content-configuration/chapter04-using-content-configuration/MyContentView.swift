//
//  MyContentView.swift
//  chapter04-using-content-configuration
//
//  Created by 藤門莉生 on 2024/08/04.
//

import Foundation
import UIKit

// MyContentConfigurationはDataSourceからCellに渡したいデータを保持する
struct MyContentConfiguration: UIContentConfiguration {
    let name: String
    
    private let cellRegistration = UICollectionView.CellRegistration<UICollectionViewCell, MyItem> { cell, indexPath, item in
        cell.contentConfiguration = MyContentConfiguration(name: item.name)
    }
   
    // makeContentView()で返すMyContentViewクラスを実装
    // UIViewクラスのサブクラスであり、なおかつ UIContentViewプロトコルを実装している必要がある。
    func makeContentView() -> UIView & UIContentView {
        MyContentView(configuration: self)
    }
    
    func updated(for state: any UIConfigurationState) -> MyContentConfiguration {
        self
    }
}

// UIContentViewプロトコルは、UIContentConfiguration型のプロパティ configurationを持つことを要求する。
// DataSourceからconfigurationインスタンスとして表示データが渡され、
// それをビューに反映することがUIContentViewに期待される。
final class MyContentView: UIView, UIContentView {
    private let nameLabel = UILabel()
   
    // didSetで内部ビューに表示データを反映
    // UICollectionViewCellのサブクラスを作る方法と比較すると、
    // 実装ミスが起こりにくくなっている。
    // UICollectionViewCellのcontentVieプロパティを意識する必要がなく、
    // 普通のビューを作るように実装できる。
    // また、データの受け渡しの方法も configurationとしてまとめられている。
    var configuration: UIContentConfiguration {
        didSet {
            guard let configuration = configuration as? MyContentConfiguration else {
                return
            }
            nameLabel.text = configuration.name
        }
    }
   
    //  今回の実装では、イニシャライザでconfiugrationを受け取れるようにしている。
    init(configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
