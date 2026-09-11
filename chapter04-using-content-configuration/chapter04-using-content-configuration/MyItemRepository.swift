import Foundation

struct MyItem {
    let name: String
}

final class MyItemRepository {
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
