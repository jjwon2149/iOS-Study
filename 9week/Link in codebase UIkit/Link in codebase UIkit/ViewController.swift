//
//  ViewController.swift
//  Link in codebase UIkit
//
//  Created by 정종원 on 5/21/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuButton = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Options"
        menuButton.configuration = configuration
        menuButton.addAction(UIAction { [weak self] _ in
            self?.showMenu()
        }, for: .touchUpInside)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuButton)
        
        NSLayoutConstraint.activate([
            menuButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menuButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func showMenu() {
        let alert = UIAlertController(title: "Options", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Open", style: .default) { _ in
            self.showMessage("Open chosen")
        })
        alert.addAction(UIAlertAction(title: "Close", style: .destructive))
        present(alert, animated: true)
    }
    func showMessage(_ message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

