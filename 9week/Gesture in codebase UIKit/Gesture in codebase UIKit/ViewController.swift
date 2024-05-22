//
//  ViewController.swift
//  Gesture in codebase UIKit
//
//  Created by 정종원 on 5/22/24.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(image: UIImage(systemName: "star.fill"))
        imageView.frame = CGRect(x: view.bounds.midX - 100, y: view.bounds.midY - 100, width: 200, height: 200)
        imageView.isUserInteractionEnabled = true
        
        let gesture = UIRotationGestureRecognizer(target: self, action: #selector(handleGesture))
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture))
        
        imageView.addGestureRecognizer(gesture)
        imageView.addGestureRecognizer(panGesture)
        imageView.addGestureRecognizer(pinchGesture)
        
        gesture.delegate = self
        panGesture.delegate = self
        pinchGesture.delegate = self
        
        view.addSubview(imageView)
    }
    
    //단일 제스처 허용 여뷰
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer is UIPanGestureRecognizer {
            return true
        } else {
            return true
        }
    }
    
    //복합 제스처 허용 여부
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @objc func handleGesture(_ sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
            view.transform = view.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }
    
    @objc func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        let tranlation = sender.translation(in: view)
        if let view = sender.view {
            view.center = CGPoint(x: view.center.x + tranlation.x, y: view.center.y + tranlation.y)
            sender.setTranslation(.zero, in: view)
        }
    }
    
    @objc func handlePinchGesture(_ sender: UIPinchGestureRecognizer) {
        if let view = sender.view {
            view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
        }
    }
}

