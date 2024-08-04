//
//  MyCollectionViewCell.swift
//  chapter05-group-nest
//
//  Created by 藤門莉生 on 2024/08/04.
//

import Foundation
import UIKit

final class MyCollectionViewCell: UICollectionViewCell {
    private let nameLabel = UILabel()
    
    var name: String? {
        didSet {
            nameLabel.text = name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        name = nil
    }
    
    private func setupConstraints() {
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 1.0
        
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
