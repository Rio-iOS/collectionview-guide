//
//  MyContentView.swift
//  chapter04-mutil-cell
//
//  Created by 藤門莉生 on 2024/08/04.
//

import Foundation
import UIKit

struct MyContentConfiguration: UIContentConfiguration {
    
    let name: String
    
    private let cellRegistration = UICollectionView.CellRegistration<UICollectionViewCell, MyItem> { cell, indexPath, item in
        cell.contentConfiguration = MyContentConfiguration(name: item.name)
    }
    
    func makeContentView() -> any UIView & UIContentView {
        MyContentView(configuration: self)
    }

    func updated(for state: any UIConfigurationState) -> MyContentConfiguration {
        self
    }
}

class MyContentView: UIView, UIContentView {
    private let nameLabel = UILabel()
    
    var configuration: UIContentConfiguration {
        didSet {
            guard let configuration = configuration as? MyContentConfiguration else {
                return
            }
            nameLabel.text = configuration.name
        }
    }
    
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
