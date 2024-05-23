//
//  ViewController.swift
//  NavigationControllerInCodebaseUIKit
//
//  Created by 정종원 on 5/23/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //둘다 가능
        self.navigationItem.title = "네비게이션 타이틀"
//        self.title = "네비게이션 타이틀"
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = .systemRed
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let leftButton = UIBarButtonItem(barButtonSystemItem: .add,
                                         target: self,
                                         action: #selector(leftButtonTapped))
        self.navigationItem.leftBarButtonItem = leftButton
        
        let rightButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(rightButtonTapped))
        
        let extraButton = UIBarButtonItem(barButtonSystemItem: .action,
                                         target: self,
                                         action: #selector(extraButtonTapped))
        self.navigationItem.rightBarButtonItems = [rightButton, extraButton]
    }

    @objc func leftButtonTapped() {
        print("왼쪽버튼 탭됨")
    }
    
    @objc func rightButtonTapped() {
        print("우측 버튼 탭됨")
    }
    
    @objc func extraButtonTapped() {
        print("왼쪽버튼 탭됨")
    }
}

