//
//  MyItemRepository.swift
//  chapter06
//
//  Created by 藤門莉生 on 2024/08/04.
//

import Foundation

struct MyItem: Identifiable {
    let id = UUID()
    let name: String
}

enum MySection: CaseIterable {
    case main
}

final class MyItemRepository {
    private let items = (0..<30).map {
        MyItem(name: "Item0 \($0)")
    }
    
    func sections() -> [MySection] {
        MySection.allCases
    }
    
    func ids(in section: MySection) -> [MyItem.ID] {
        switch section {
        case .main:
            return items.map { $0.id }
        }
    }
    
    func item(id: MyItem.ID) -> MyItem? {
        items.first { $0.id == id }
    }
}
