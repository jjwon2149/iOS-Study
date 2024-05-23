//
//  NextViewController.swift
//  NavigationControllerInCodebaseUIKit
//
//  Created by 정종원 on 5/23/24.
//

import UIKit

protocol NextViewControllerDelegate {
    func save(animal: Animal)
}

class NextViewController: UIViewController {

    var animal: Animal?
    
    var delegate: NextViewControllerDelegate?
    
    init(animal: Animal) {
        self.animal = animal
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "다음 화면"
        
        if let delegate = self.delegate {
            delegate.save(animal: Animal(name: "호루랑이"))
        }
        
        let label = UILabel()
        
        label.text = animal?.name
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}
