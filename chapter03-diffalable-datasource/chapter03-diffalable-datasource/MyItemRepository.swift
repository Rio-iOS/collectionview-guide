//
//  MyItemRepository.swift
//  chapter03-diffalable-datasource
//
//  Created by 藤門莉生 on 2024/07/25.
//

import Foundation

// Identifiiableプロトコルを適用
// idプロパティを持つことを要求
// idプロパティで識別できる
struct MyItem: Identifiable {
    let id = UUID()
    let name: String
}

final class MyItemRepository {
    private var items = (0..<30).map { MyItem(name: "Item \($0)") }
   
    // アイテムの代わりに、アイテムのidの配列を返す
    func ids() -> [MyItem.ID] {
        items.map { $0.id }
    }
   
    func numberOfSections() -> Int { 2 }
    
    func numberOfItems(inSection section: Int) -> Int {
        items.count
    }

    // アイテムを取得するメソッドでは、idを指定
    func item(id: MyItem.ID) -> MyItem? {
        items.first { $0.id == id }
    }
}
