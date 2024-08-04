//
//  MyItemRepository.swift
//  chapter05-group-nest
//
//  Created by 藤門莉生 on 2024/08/04.
//

import Foundation

struct MyItem {
    let name: String
}

final class MyItemRepository {
    private var items = (0..<30).map {
        MyItem(name: "Item \($0)")
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func item(at index: Int) -> MyItem {
        items[index]
    }
}
