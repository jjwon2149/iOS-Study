//
//  ViewController.swift
//  Picker in codebase UIkit
//
//  Created by 정종원 on 5/21/24.
//

import UIKit

class ViewController: UIViewController, UIColorPickerViewControllerDelegate {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Color Picker"
        configuration.cornerStyle = .capsule
        button.configuration = configuration
        
        //unowned optional하지 않은 self... 확실할때만 사용 해야함.
        button.addAction(UIAction{ [unowned self] _ in
            let colorPicker = UIColorPickerViewController()
            colorPicker.delegate = self
            colorPicker.supportsAlpha = false
            colorPicker.selectedColor = view.backgroundColor ?? .white
            self.present(colorPicker, animated: true)
        }, for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
}

