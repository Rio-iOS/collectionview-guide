//
//  ViewController.swift
//  chapter03-diffalable-datasource
//
//  Created by 藤門莉生 on 2024/07/25.
//

import UIKit

class MyViewController: UIViewController {
    private let repository = MyItemRepository()
    private var collectionView: UICollectionView!
    // MyCollectionViewDataSourceを保持する代わりに
    // UICollectionViewDiffableDataSourceを保持する。
    // UICollectionViewDiffableDataSourceはジェネリック型で、
    // セクションの識別子の型とアイテムの識別子の型を指定
    private var dataSource: UICollectionViewDiffableDataSource<Int, MyItem.ID>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: makeCollectionViewLayout()
        )
        
        setupConstraints()
       
        // UICollectionViewのdataSourceプロパティを直接設定する必要はなくなっている
        // UICollectionViewDiffableDiffableDataSourceの内部でその処理が行われているため
        dataSource = makeDataSource(for: collectionView, repository: repository)
      
        // reloadData()メソッドを呼ぶ代わりに、applySnapshot()メソッドを呼ぶ
        applySnapshot()
    }
    
    private func setupConstraints() {
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

extension MyViewController {
    func applySnapshot() {
        // 表示したいデータは、NSDiffableDataSourceSnapshotクラスで表現する。
        // UICollectionViewDiffableDataSourceのapply()メソッドでデータを渡す。
        // snapshotにはセクションとアイテムの情報を渡す。
        // appendSections()メソッドでセクションの識別子の配列を追加する。
        // ここではセクションは一つだけで、セクションの識別子の型はIntにしていたので、[0]を渡す。
        // appendItems()メソッドでアイテムの識別子の配列を追加する。
        // MyItemRepositoryのids()メソッドで取得できるようにしたので、そのまま渡す。
        // UICollectionViewDiffableDataSourceを使っている場合は、
        // データの更新は単に apply()メソッドで新しいスナップショットを渡すだけ。
        // UICollectionViewDiffableDataSourceは現在のスナップショットを保持しており、
        // apply()メソッドの際には新しいスナップショットと比較して差分を検出する。
        // 表示の更新が必要な場所についてはアニメーション付きで更新してくれる。
        // 差分を検出できる仕組みを実現できるのが、スナップショットの効果である。
        // 差分検出の仕組みを持つことが Diffable という名前の由来でもある。
        // また、毎回新しいスナップショットを一から組み立てる代わりに、
        // 既存のスナップショットに変更を加えて新しいスナップショットを生成できる。
        // NSDiffableDataSourceSnapshotには、以下のようなメソッドが用意されている。
        // - insetItems(_:afterItem:)
        // - delete()
        // - moveItem(_:afterItem:)
        // これらのメソッドでスナップショットを変更した後に
        // UICollectionViewDataSourceのapply()にそのスナップショットを渡すことで、
        // 変更を反映できる。
        // 特定のアイテムを再読み込みしたい場合には、
        // NSDiffableDataSourceSnapshotに以下のようなメソッドが用意されている。
        // - reconfigureItems(_:)
        // - reloadItems(_:)
        // これらのメソッドを使うと、アイテムの再読み込みを要求しているということが
        // スナップショット内部に記録される。
        // UICollectionViewDiffableDataSourceのapply()にそのスナップショットを
        // 渡すことで、実際に再読み込みが実行される。
        // 再読み込みの時に、アイテムを表示するセルを変更しない場合は、
        // reconfigureItems(_:)を使う。
        // セルの再利用時のセルの初期化処理をスキップすることで、
        // 表示のパフォーマンスを向上させる。
        // セルの変更が必要な場合は、reloadItems(_:)を使う。
        var snapshot = NSDiffableDataSourceSnapshot<Int, MyItem.ID>()
        snapshot.appendSections([0])
        snapshot.appendItems(repository.ids())
        dataSource.apply(snapshot)
    }
}
