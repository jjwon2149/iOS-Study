//
//  ViewController.swift
//  Gesture in codebase UIKit
//
//  Created by 정종원 on 5/22/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(image: UIImage(systemName: "star.fill"))
        imageView.frame = CGRect(x: view.bounds.midX - 100, y: view.bounds.midY - 100, width: 200, height: 200)
        imageView.isUserInteractionEnabled = true
        
        let gesture = UIRotationGestureRecognizer(target: self, action: #selector(handleGesture))
        
        imageView.addGestureRecognizer(gesture)
        
        view.addSubview(imageView)
    }
    
    @objc func handleGesture(_ sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
            view.transform = view.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }
    
}

