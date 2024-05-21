//
//  ViewController.swift
//  TextInputApp
//
//  Created by 정종원 on 5/21/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var secureTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayLabel.text = ""
        
        textField.borderStyle = .roundedRect
        secureTextField.borderStyle = .roundedRect
        
        //keyboardType
        textField.keyboardType = .emailAddress
        secureTextField.isSecureTextEntry = true
        
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 5.0
        textView.font = .systemFont(ofSize: 16.0)
        
    }
    
    
    @IBAction func submitButtonDidTapped(_ sender: UIButton) {
        let textFieldText = textField.text ?? ""
        let secureTextField = secureTextField.text ?? ""
        let textViewText = textView.text ?? ""
        
        displayLabel.text = "textFieldText: \(textFieldText)\n secureTextField: \(secureTextField)\n textViewText: \(textViewText)"
        
        self.textField.text = ""
        self.secureTextField.text = ""
        self.textView.text = ""
    }
}

