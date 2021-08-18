//
//  ShoppingListViewController.swift
//  ListaDeCompras
//
//  Created by Gabriela Sillis on 17/08/21.
//

import UIKit

class ShoppingListViewController: UIViewController {

    private var controller: ShoppingListItemController?

    @IBOutlet weak var shoppingTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.shoppingTableView.delegate = self
        self.shoppingTableView.dataSource = self
        self.shoppingTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: CustomCell.identifier)
        self.shoppingTableView.tableFooterView = UIView()
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        self.presentAlert(title: "Produto", message: "Insira o produto") {
            self.shoppingTableView.reloadData()
            print("clicou")
        }
    }
}

extension ShoppingListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.controller?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomCell? = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicou")
    }
}
