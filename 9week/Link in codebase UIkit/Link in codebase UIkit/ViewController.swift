//
//  ViewController.swift
//  Link in codebase UIkit
//
//  Created by 정종원 on 5/21/24.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.isHidden = true
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let linkButton = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Apple"
        linkButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        linkButton.configuration = configuration
        
        linkButton.translatesAutoresizingMaskIntoConstraints = false
        
        linkButton.addAction(UIAction{ [weak self] _ in
            if let url = URL(string: "https://www.apple.com") {
                self?.openInWebView(url: url)
            }
        }, for: .touchUpInside)
        
        view.addSubview(linkButton)
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            linkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            linkButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func openInWebView(url: URL) {
        let request = URLRequest(url: url)
        webView.load(request)
        webView.isHidden = false
    }
 
}

