import UIKit

final class MyViewController: UIViewController {
    private let repository = MyItemRepository()
    private var collectionView: UICollectionView!
    private var dataSource: MyCollectionViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: makeCollectionViewLayout()
        )
        
        setupConstraints()
        
        dataSource = MyCollectionViewDataSource(repository: repository)
        
        collectionView.dataSource = dataSource
        collectionView.reloadData()
    }
}

private extension MyViewController {
    func setupConstraints() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
}
