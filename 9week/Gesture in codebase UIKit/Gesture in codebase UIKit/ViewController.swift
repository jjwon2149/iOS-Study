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
        
        
        let rectangle = UIView()
        rectangle.backgroundColor = .yellow
        rectangle.frame = CGRect(x: 100, y: 100, width: 275, height: 125)
        rectangle.isUserInteractionEnabled = true //터치 이벤트를 사용 가능
        
        view.addSubview(rectangle)
        
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleGesture))
        gesture.minimumPressDuration = 2.0
        rectangle.addGestureRecognizer(gesture)
        
    }
    
    @objc func handleGesture(_ sender: UILongPressGestureRecognizer) {
        print("\(sender.state)")
        if let view = sender.view, sender.state == .began {
            view.backgroundColor = (view.backgroundColor == UIColor.yellow) ? .red : .yellow
        }
    }
}

