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
        self.arrayItem.append(ShoppingListItem(item: item))
    }
}
