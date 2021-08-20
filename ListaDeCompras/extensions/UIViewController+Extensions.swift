//
//  UIViewController+Extensions.swift
//  ListaDeCompras
//
//  Created by Gabriela Sillis on 19/08/21.
//

import UIKit

extension UIViewController {
    
    func alert(title: String, message: String, completion: @escaping(_ text: String) -> Void) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addTextField { (textfield) in
            textfield.placeholder = "insira o produto"
        }

        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            guard let texfield = alert.textFields?[0], let text = texfield.text else { return }
            completion(text)
        }))

        present(alert, animated: true, completion: nil)
    }
}
