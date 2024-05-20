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
        
        //이거 사용하지말고 webView + css
        let attributedString = NSMutableAttributedString(string: "Hello World")
        attributedString.addAttribute(
            .font,
            value: UIFont.italicSystemFont(ofSize: 20),
            range: NSRange(location: 0, length: 5)
        )
        attributedString.addAttribute(
            .foregroundColor,
            value: UIColor.blue,
            range: NSRange(location: 6, length: 5)
        )
        attributedString.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: 11)
        )
        
        let label = UILabel()
        label.attributedText = attributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
    }
    
    
}

