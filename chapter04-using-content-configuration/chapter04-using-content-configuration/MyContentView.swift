import Foundation
import UIKit

// MyContentConfigurationはDataSourceからCellに渡したいデータを保持する
struct MyContentConfiguration: UIContentConfiguration {
    let name: String
    
   
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
    // UICollectionViewCellのcontentViewプロパティを意識する必要がなく、
    // 普通のビューを作るように実装できる。
    // また、データの受け渡しの方法も configurationとしてまとめられている。
    var configuration: UIContentConfiguration {
        didSet { applyConfiguration() }
    }
   
    //  今回の実装では、イニシャライザでconfigurationを受け取れるようにしている。
    init(configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        setupConstraints()
        applyConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 初期化と再設定で共通の表示更新を使い、別の設定型を受け取った場合は以前の値を残しません。
    private func applyConfiguration() {
        nameLabel.text = (configuration as? MyContentConfiguration)?.name
    }

    private func setupConstraints() {
        nameLabel.font = .preferredFont(forTextStyle: .body)
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.numberOfLines = 0
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
