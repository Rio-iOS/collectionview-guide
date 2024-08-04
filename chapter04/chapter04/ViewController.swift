//
//  ViewController.swift
//  chapter04
//
//  Created by 藤門莉生 on 2024/08/04.
//

import UIKit

class MyViewController: UIViewController {
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDataSource!
    private let repository = MyItemRepository()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: makeCollectionViewLayout()
        )
       
        // iOS13以前のReuse Identifierを利用する方法
        // register(_:forCellWithReuseIdentifier:)を使ってセルを登録
        // この方法は、先にセルを登録しておき、必要になったら取り出すというシンプルな実装であり、
        // 直感的で理解しやすい。
        // 欠点としては、セルの登録を忘れたり、ReuseIdentifier文字列を間違えたりすると、
        // セルの取り出しに失敗する。
        // セルの取り出し後にキャストしてセルの内容を設定する必要がある。
        // これらの欠点は、CellRegistrationを使うことで解消される。
        // セルの取り出し時にCellRegistrationを渡すため、セルの登録を忘れたり、
        // ReuseIdentifier文字列に依存したりすることを避けられる。
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.reuseIdentifier)
        
        dataSource = MyCollectionViewDataSource(repository: repository)
        
        collectionView.dataSource = dataSource
        
        collectionView.reloadData()
        
        // setupConstraints()を利用しなくても可能
        view = collectionView
    }
}

private extension MyViewController {
    // setupConstraints()を利用しなくても可能
    func setupConstraints() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
