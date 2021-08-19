//
//  ShoppingListViewController.swift
//  ListaDeCompras
//
//  Created by Gabriela Sillis on 17/08/21.
//

import UIKit

class ShoppingListViewController: UIViewController {

    private var controller = ShoppingListItemController()

    private var id: Int?

    @IBOutlet weak var shoppingTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.shoppingTableView.delegate = self
        self.shoppingTableView.dataSource = self

        self.shoppingTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: CustomCell.identifier)
        self.shoppingTableView.register(UINib(nibName: "EmptyCell", bundle: nil), forCellReuseIdentifier: EmptyCell.identifier)

        self.shoppingTableView.tableFooterView = UIView()
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        self.alert(title: "Novo item", message: "Deseja adicionar um item?") { text in
            self.controller.didCreateItem(item: text)
            self.shoppingTableView.reloadData()
        }
    }

    private func alertSheet(removeCompletion: @escaping()-> Void) {
        let alert: UIAlertController = UIAlertController(title: "Alerta", message: "Deseja realizar alterações no produto?", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Tirar foto", style: .default, handler: { _ in
            self.imagePicker(sourceType: .camera)
        }))

        alert.addAction(UIAlertAction(title: "Escolher da galeria", style: .default, handler: { _ in
            self.imagePicker(sourceType: .photoLibrary)
        }))

        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))

        alert.addAction(UIAlertAction(title: "Remover", style: .destructive, handler: { _ in
            // completion para remover item
            removeCompletion()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }

    private func imagePicker(sourceType: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
}

extension ShoppingListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.controller.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if controller.emptyState() {
            let emptyCell: EmptyCell? = tableView.dequeueReusableCell(withIdentifier: EmptyCell.identifier, for: indexPath) as? EmptyCell

            return emptyCell ?? UITableViewCell()
        } else {
            let cell: CustomCell? = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell

            cell?.addNewItem(value: self.controller.loadItem(indexPath: indexPath))

            return cell ?? UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !controller.emptyState() {
            self.id = indexPath.row
            self.alertSheet(removeCompletion: {
                //remove os itens do array no indexpath
                self.controller.removeItem(indexPath: indexPath)
                self.shoppingTableView.reloadData()
            })
        }
    }
}

extension ShoppingListViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let info = info[.imageURL] else { return }

        self.controller.update(newImage: String(describing: info), id: self.id ?? 0)
        self.shoppingTableView.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
}

