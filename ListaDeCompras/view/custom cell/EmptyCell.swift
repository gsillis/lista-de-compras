//
//  EmptyCell.swift
//  ListaDeCompras
//
//  Created by Gabriela Sillis on 19/08/21.
//

import UIKit

class EmptyCell: UITableViewCell {

    static let identifier = "emptyCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        self.isUserInteractionEnabled = false
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
