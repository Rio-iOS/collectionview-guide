//
//  MyCollectionViewCell.swift
//  chapter02
//
//  Created by 藤門莉生 on 2024/07/22.
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
   
    // セルが再利用されるときに呼ばれるメソッド
    // 再利用時には前の内容が残っている可能性があるため、prepareForReuse()の中で、
    // 内容をクリアにしておく。
    override func prepareForReuse() {
        super.prepareForReuse()
        name = nil
    }
    
    private func setupConstraints() {
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
