//
//  ViewController.swift
//  Image in codebase UIKit
//
//  Created by 정종원 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let circleView = UIView()
        circleView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        circleView.backgroundColor = .yellow
        circleView.layer.cornerRadius = 50
        circleView.layer.borderWidth = 2
        circleView.layer.borderColor = UIColor.black.cgColor
//        circleView.clipsToBounds = true //빠져나오는 텍스트를 잘라줌
//
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
//        label.text = "Hello World"
//        circleView.addSubview(label)
        
        self.view.addSubview(circleView)
        
        let squreView = UIView()
        squreView.frame = CGRect(x: 220, y: 100, width: 100, height: 100)
        squreView.backgroundColor = .blue
        
        let gredientLayer = CAGradientLayer()
        gredientLayer.frame = squreView.bounds
        gredientLayer.colors = [UIColor.red.cgColor, UIColor.orange.cgColor]
        gredientLayer.startPoint = CGPoint(x: 0, y: 0) //좌상단
        gredientLayer.endPoint = CGPoint(x: 1, y: 1) //우하단
        squreView.layer.insertSublayer(gredientLayer, at: 0) //앞쪽에 필터입히기
        
        view.addSubview(squreView)
    }
    
    


}

