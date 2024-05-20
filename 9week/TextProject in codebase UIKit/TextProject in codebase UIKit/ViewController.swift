//
//  ViewController.swift
//  TextProject in codebase UIKit
//
//  Created by 정종원 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas tellus rutrum tellus pellentesque eu. Nibh tortor id aliquet lectus proin nibh nisl condimentum id. Eget velit aliquet sagittis id consectetur. Aliquam eleifend mi in nulla posuere. Nunc consequat interdum varius sit amet mattis. Ac tincidunt vitae semper quis. Augue neque gravida in fermentum et sollicitudin ac orci phasellus. Id velit ut tortor pretium viverra. Luctus venenatis lectus magna fringilla urna porttitor rhoncus. Donec enim diam vulputate ut pharetra sit amet aliquam id."
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
            
        ])
        
    }


}

