//
//  UIAlertController+Extensions.swift
//  ListaDeCompras
//
//  Created by Gabriela Sillis on 17/08/21.
//

import UIKit

extension UIViewController {
    func presentAlert(title: String, message: String, completion: @escaping()->Void) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { (textfield) in
            textfield.placeholder = "insira o produto"
        }
        let cancel: UIAlertAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let confirm: UIAlertAction = UIAlertAction(title: "Ok", style: .default) { _ in
            completion()
            guard let textfield = alert.textFields?[0], let input = textfield.text else { return }
            print(input)
        }

        alert.addAction(cancel)
        alert.addAction(confirm)
        present(alert, animated: true, completion: nil)
    }
}
