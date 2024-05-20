//
//  ViewController.swift
//  AutoLayout
//
//  Created by 정종원 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let box = UIView()
        box.backgroundColor = .red
        box.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(box)
        
        NSLayoutConstraint.activate([
            //박스안의 동적으로 바뀌는 값의 최소,최대값정의
            box.widthAnchor.constraint(lessThanOrEqualToConstant: 200), //이것보단 같거나 커야함
            box.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            
            box.widthAnchor.constraint(equalToConstant: 1000),
            box.heightAnchor.constraint(equalToConstant: 50),
            
            box.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            box.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
            
            
        ])
        
    }
    
    
}

