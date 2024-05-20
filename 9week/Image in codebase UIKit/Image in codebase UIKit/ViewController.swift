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
        
        //black에 alpha를 주어 gray로 만든것과 그냥 gray
        //alpha가 성능에 더 좋지 않음. 알고 써라~
        let imageView = UIImageView(image: UIImage(systemName: "hare.fill"))
        imageView.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        imageView.tintColor = .purple
        imageView.contentMode = .scaleAspectFit
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
        
        imageView.layer.shadowColor = UIColor.red.cgColor
        imageView.layer.shadowOpacity = 8.8
        imageView.layer.shadowOffset = CGSize(width: 10, height: 10)
        imageView.layer.shadowRadius = 6
        
        imageView.layer.borderColor = UIColor.blue.cgColor
        imageView.layer.borderWidth = 10
        
        imageView.alpha = 0.75
        
        self.view.addSubview(imageView)
        
        let flagImageView = UIImageView(image: UIImage(systemName: "flag"))
        flagImageView.frame = CGRect(x: 50, y: 200, width: 100, height: 100)
        flagImageView.clipsToBounds = true
        flagImageView.contentMode = .scaleAspectFill
        self.view.addSubview(flagImageView)
        
    }
}

