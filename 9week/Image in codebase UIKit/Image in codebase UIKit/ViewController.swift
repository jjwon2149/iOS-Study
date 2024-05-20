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
        //이미지뷰는 이미지를 띄우는 액자~
        let imageView = UIImageView(image: UIImage(systemName: "hare.fill"))
        imageView.frame = CGRect(x: 50, y: 50, width: 100, height: 50)
        imageView.tintColor = .purple
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        let flagImageView = UIImageView(image: UIImage(systemName: "flag.fill"))
        flagImageView.frame = CGRect(x: 50, y: 150, width: 100, height: 50)
        flagImageView.clipsToBounds = true
        flagImageView.tintColor = .blue
        flagImageView.contentMode = .scaleAspectFill
        view.addSubview(flagImageView)
    }
    
    


}

