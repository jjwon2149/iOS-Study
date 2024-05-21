//
//  ViewController.swift
//  SegmentedControl in codebase UIKit
//
//  Created by 정종원 on 5/21/24.
//

import UIKit

class ViewController: UIViewController {
    let segementedControl = UISegmentedControl(items: ["Red", "Green", "Blue"])
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segementedControl.selectedSegmentIndex = 0
        segementedControl.addAction(UIAction { [weak self] _ in
            switch self?.segementedControl.selectedSegmentIndex {
            case 0:
                self?.view.backgroundColor = .red
            case 1:
                self?.view.backgroundColor = .green
            case 2:
                self?.view.backgroundColor = .blue
            default:
                self?.view.backgroundColor = .white
                break
            }
        }, for: .valueChanged)
        
        segementedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segementedControl)
        
        NSLayoutConstraint.activate([
            segementedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segementedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        ])
    }
}

