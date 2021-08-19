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
        return self.arrayItem.count
    }

    func loadItem(indexPath: IndexPath) ->  ShoppingListItem? {
        return self.arrayItem[indexPath.row]
    }

    func didCreateItem(item: String) {
        self.arrayItem.append(ShoppingListItem(item: item, image: "brand-identity"))
    }

    func update(newImage: String) {
        if let index = self.arrayItem.firstIndex(where: ({$0.image == newImage})) {
            arrayItem[index].image = newImage
        }
    }

    func removeItem(indexPath: IndexPath) {
        self.arrayItem.remove(at: indexPath.row)
    }
}
