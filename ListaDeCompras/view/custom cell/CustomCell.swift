//
//  CustomCellTableViewCell.swift
//  ListaDeCompras
//
//  Created by Gabriela Sillis on 17/08/21.
//

import UIKit

class CustomCell: UITableViewCell {

    static let identifier: String = "CustomCellTableViewCell"

    @IBOutlet weak var shoppingImage: UIImageView!
    @IBOutlet weak var shoppingItemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func addNewItem(value: ShoppingListItem?) {
        if let data = value {

            if data.image.hasPrefix("brand") {
                self.shoppingItemLabel.text = data.item
                self.shoppingImage.image = UIImage(named: data.image )
            } else {

                do {
                    guard  let url: URL = URL(string: data.image) else { return }
                    let data = try Data(contentsOf: url, options: .mappedIfSafe)
                    self.shoppingImage.image = UIImage(data: data)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

    func updateImage(image: ShoppingListItem?) {
        if let data = image {
            self.shoppingImage.image = UIImage(named: data.image )
        }
    }
}
