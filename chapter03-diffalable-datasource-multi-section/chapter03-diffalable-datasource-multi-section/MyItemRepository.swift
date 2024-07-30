//
//  MyItemRepository.swift
//  chapter03-diffalable-datasource-multi-section
//
//  Created by 藤門莉生 on 2024/07/30.
//

import Foundation

struct MyItem: Identifiable {
    let id = UUID()
    let name: String
}

// セクションの識別子の型 MySectionを新しく定義
// Intのままでも構わないが、enumを活用する方が分かりやすくなる。
enum MySection: CaseIterable {
    case main
    case secondary
}

final class MyItemRepository {
    private var item0 = (0..<15).map { MyItem(name: "Section 0 Item \($0)") }
    private var item1 = (0..<15).map { MyItem(name: "Section 1 Item \($0)") }
    private var items: [MyItem] {
        item0 + item1
    }
    
    func sections() -> [MySection] {
        MySection.allCases
    }
    
    func ids(in section: MySection) -> [MyItem.ID] {
        switch section {
        case .main:
            return item0.map { $0.id }
        case .secondary:
            return item1.map { $0.id }
        }
    }
    
    func item(id: MyItem.ID) -> MyItem? {
        items.first { $0.id == id }
    }
}

