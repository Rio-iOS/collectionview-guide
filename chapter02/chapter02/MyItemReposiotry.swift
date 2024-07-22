//
//  MyItemReposiotry.swift
//  chapter02
//
//  Created by 藤門莉生 on 2024/07/22.
//

import Foundation

struct MyItem {
    let name: String
}

final class MyItemRepository {
    private var items = (0..<30).map { MyItem(name: "Item \($0)") }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func item(at index: Int) -> MyItem {
        items[index]
    }
}
