//
//  MyItemRepository.swift
//  chapter03
//
//  Created by 藤門莉生 on 2024/07/25.
//

import Foundation

struct MyItem {
    let name: String
}

class MyItemRepository {
    private var item0 = (0..<15).map { MyItem(name: "Section 0 Item \($0)") }
    private var item1 = (0..<15).map { MyItem(name: "Section 1 Item \($0)") }
   
    func numberOfSections() -> Int { 2 }
    
    func numberOfItems(inSection section: Int) -> Int {
        switch section {
        case 0: return item0.count
        case 1: return item1.count
        default: return 0
        }
    }
    
    func item(at indexPath: IndexPath) -> MyItem? {
        switch indexPath.section {
        case 0: return item0[indexPath.item]
        case 1: return item1[indexPath.item]
        default: return nil
        }
    }
    
}
