//
//  ShoppingListItemController.swift
//  ListaDeCompras
//
//  Created by Gabriela Sillis on 17/08/21.
//

import Foundation


class ShoppingListItemController {
    private var item: ShoppingListItem?

    var count: Int {
        guard let value = item?.item.count else { return 0 }
        return value
    }

}
