//
//  ShoppingListViewController.swift
//  ListaDeCompras
//
//  Created by Gabriela Sillis on 17/08/21.
//

import UIKit

class ShoppingListViewController: UIViewController {

    private var controller = ShoppingListItemController()

    @IBOutlet weak var shoppingTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.shoppingTableView.delegate = self
        self.shoppingTableView.dataSource = self
        self.shoppingTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: CustomCell.identifier)
        self.shoppingTableView.tableFooterView = UIView()
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        self.alert(title: "Produto", message: "Insira o produto")
    }

   private func alert(title: String, message: String) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addTextField { (textfield) in
            textfield.delegate = self
            textfield.placeholder = "insira o produto"
        }

        let cancel: UIAlertAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let confirm: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)

        alert.addAction(cancel)
        alert.addAction(confirm)

        present(alert, animated: true, completion: nil)
    }
}

extension ShoppingListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.controller.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomCell? = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell

        cell?.addNewItem(value: self.controller.loadItem(indexPath: indexPath))
        
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicou")
    }
}

extension ShoppingListViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text {
            self.controller.didCreateItem(item: text)
        }
        self.shoppingTableView.reloadData()
        return true
    }
}
