//
//  ShoppingListItemController.swift
//  ListaDeCompras
//
//  Created by Gabriela Sillis on 17/08/21.
//

import Foundation

class ShoppingListItemController {
    private var arrayItem: [ShoppingListItem ] = []

    var count: Int {
        if arrayItem.isEmpty {
            return 1
        }
        return self.arrayItem.count
    }

    func emptyState() -> Bool {
        return arrayItem.isEmpty
    }

    func loadItem(indexPath: IndexPath) ->  ShoppingListItem? {
        return self.arrayItem[indexPath.row]
    }

    func didCreateItem(item: String) {
        self.arrayItem.append(ShoppingListItem(item: item, image: "brand-identity"))
    }

    func update(newImage: String, id: Int) {
        self.arrayItem[id].image = newImage
    }

    func removeItem(indexPath: IndexPath) {
        self.arrayItem.remove(at: indexPath.row)
    }
}
