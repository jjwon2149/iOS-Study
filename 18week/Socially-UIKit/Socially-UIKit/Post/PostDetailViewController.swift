//
//  PostDetailViewController.swift
//  Socially-UIKit
//
//  Created by 정종원 on 7/26/24.
//

import UIKit

class PostDetailViewController: UIViewController {

    var post: Post
    
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PostDetail"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }
}
