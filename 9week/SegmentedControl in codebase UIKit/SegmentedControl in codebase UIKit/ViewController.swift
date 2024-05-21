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
        
        let button = UIButton(type: .custom)
//deprecated        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        configuration.cornerStyle = .medium
        
        configuration.title = "Click Me!"
        configuration.baseBackgroundColor = .systemBlue
        configuration.baseForegroundColor = .white
        
        button.configuration = configuration
        
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

