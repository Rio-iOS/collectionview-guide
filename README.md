# collectionview-guide

UICollectionViewのレイアウト、データソース、セル構成を章ごとに検証するサンプル集です。

## 検証環境と実行方法

検証用ツールチェーンはXcode 26.6 / Swift 6.3です。Swiftの言語モード・iOSの最低バージョンは各プロジェクトの設定を使用します。macOSでXcodeをインストールし、初回起動時の追加コンポーネントのインストールを完了してください。

リポジトリのルートで以下を実行します。

```sh
# 検証対象と番号の一覧
swift Scripts/verify.swift --list

# 全対象を順番に検証
swift Scripts/verify.swift

# 1件だけ検証（0始まり）
swift Scripts/verify.swift --index 0
```

アプリは署名不要のSimulator向けにビルドし、Swiftパッケージは `swift test` で検証します。作業用ディレクトリは実行ごとに作成・削除するため、初回と同様に時間がかかります。依存パッケージの取得にはネットワーク接続が必要です。

## 検証対象

| 番号 | 対象 | 種類 | 開く場所 |
| ---: | --- | --- | --- |
| 0 | `chapter02-horizontal` | Simulatorビルド | `chapter02-horizontal/chapter02-horizontal.xcodeproj` |
| 1 | `chapter02` | Simulatorビルド | `chapter02/chapter02.xcodeproj` |
| 2 | `chapter03-diffalable-datasource-multi-section` | Simulatorビルド | `chapter03-diffalable-datasource-multi-section/chapter03-diffalable-datasource-multi-section.xcodeproj` |
| 3 | `chapter03-diffalable-datasource` | Simulatorビルド | `chapter03-diffalable-datasource/chapter03-diffalable-datasource.xcodeproj` |
| 4 | `chapter03` | Simulatorビルド | `chapter03/chapter03.xcodeproj` |
| 5 | `chapter04-mutil-cell` | Simulatorビルド | `chapter04-mutil-cell/chapter04-mutil-cell.xcodeproj` |
| 6 | `chapter04-using-cell-registration` | Simulatorビルド | `chapter04-using-cell-registration/chapter04-using-cell-registration.xcodeproj` |
| 7 | `chapter04-using-content-configuration` | Simulatorビルド | `chapter04-using-content-configuration/chapter04-using-content-configuration.xcodeproj` |
| 8 | `chapter04` | Simulatorビルド | `chapter04/chapter04.xcodeproj` |
| 9 | `chapter05-group-nest` | Simulatorビルド | `chapter05-group-nest/chapter05-group-nest.xcodeproj` |
| 10 | `chapter05` | Simulatorビルド | `chapter05/chapter05.xcodeproj` |
| 11 | `chapter06` | Simulatorビルド | `chapter06/chapter06.xcodeproj` |

アプリを操作するには表のworkspace（ある場合）またはprojectをXcodeで開き、対象のschemeとiPhone Simulatorを選択して実行します。実機で動かす場合は、ご自身のSigning Teamを設定してください。

## CIと検証範囲

`Quality` ワークフローは上記と同じ一覧・スクリプトを使い、対象ごとにビルドまたはテストを実行します。ビルドの成功だけでは、画面表示、アクセシビリティ、通信先の動作、テスト網羅性は保証されません。UIサンプルはSimulator上での操作確認も必要です。

## 振る舞いの回帰テスト

MyContentViewは初期化とconfigurationの再設定で同じ反映処理を使います。異なる種類のconfigurationを受け取ったときは古い文字を消し、Dynamic Typeと複数行の表示に対応します。

実際のUIViewで初期表示、再利用、非対応configuration、狭い幅と大きい文字サイズを検証します。

```sh
swift Scripts/test-layout.swift
```

## Swiftコード品質

[設計・命名・所有関係の方針と、この教材への適用範囲](SWIFT-QUALITY.md)を参照してください。
