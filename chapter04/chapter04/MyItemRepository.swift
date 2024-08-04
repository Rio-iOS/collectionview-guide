//
//  MyItemRepository.swift
//  chapter04
//
//  Created by 藤門莉生 on 2024/08/04.
//

import Foundation

struct MyItem {
    let name: String
}

class MyItemRepository {
    private let items = (0..<30).map {
        MyItem(name: "Item \($0)")
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func item(at index: Int) -> MyItem {
        items[index]
    }
}
