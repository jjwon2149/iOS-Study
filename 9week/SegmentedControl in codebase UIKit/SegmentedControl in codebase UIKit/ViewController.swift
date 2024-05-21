//
//  ViewController.swift
//  SegmentedControl in codebase UIKit
//
//  Created by 정종원 on 5/21/24.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .system)
        button.setTitle("Click Me!", for: .normal)
        button.addAction( UIAction { [weak self ]_ in
            self?.count += 1
            print("Button Tapped, count: \(String(describing: self?.count))")
        }, for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


}

