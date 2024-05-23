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
        
        let appearence = UINavigationBarAppearance()
        appearence.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearence.backgroundColor = .systemBackground
        appearence.backgroundColor = .systemBrown
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearence
//        self.navigationController?.navigationBar.barStyle = .default
//        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.navigationBar.scrollEdgeAppearance?.backgroundColor = .systemBrown
//        self.navigationController?.navigationBar.backgroundColor = .systemBrown
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
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
        
        let button = UIButton(type: .system)
        button.setTitle("다음 화면으로", for: .normal)
        button.addAction(UIAction { _ in
            let nextVC = UIViewController()
            nextVC.view.backgroundColor = .white
            self.show(nextVC, sender: nil)
        }, for: .touchUpInside)
        
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        view.addSubview(button)
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

