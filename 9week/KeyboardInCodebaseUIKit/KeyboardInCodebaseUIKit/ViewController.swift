//
//  ViewController.swift
//  KeyboardInCodebaseUIKit
//
//  Created by 정종원 on 5/23/24.
//

import UIKit

class ViewController: UIViewController {
    let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        textField.borderStyle = .roundedRect
        textField.placeholder = "여기에 입력하세요"
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
        ])
    }
    
    
}

