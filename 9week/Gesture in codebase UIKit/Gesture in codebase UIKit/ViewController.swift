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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapGesture.numberOfTapsRequired = 2 //2번 탭을 해야만 함
        rectangle.addGestureRecognizer(tapGesture)
        
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if let view = sender.view {
            view.backgroundColor = (view.backgroundColor == UIColor.yellow) ? .red : .yellow
        }
    }
}

