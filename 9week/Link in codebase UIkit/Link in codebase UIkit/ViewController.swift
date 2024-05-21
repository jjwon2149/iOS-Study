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
        
        let linkButton = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Apple"
        linkButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        linkButton.configuration = configuration
        
        linkButton.translatesAutoresizingMaskIntoConstraints = false
        
        linkButton.addAction(UIAction{ _ in
            if let url = URL(string: "https://www.apple.com") {
                UIApplication.shared.open(url)
            }
        }, for: .touchUpInside)
        
        view.addSubview(linkButton)
        
        NSLayoutConstraint.activate([
            linkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            linkButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


}

