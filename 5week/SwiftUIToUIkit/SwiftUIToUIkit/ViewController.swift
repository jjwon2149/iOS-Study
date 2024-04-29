//
//  ViewController.swift
//  SwiftUIToUIkit
//
//  Created by 정종원 on 4/24/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBSegueAction func goToSwiftUI(_ coder: NSCoder) -> UIViewController? {
        
        let greetings = "Hello From UIkit"
        let rootView = Greetings(textFromUIkit: greetings)
        
        return UIHostingController(coder: coder, rootView: rootView)
    }
}

