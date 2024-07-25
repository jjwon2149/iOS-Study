//
//  ViewController.swift
//  Socially-UIKit
//
//  Created by 정종원 on 7/25/24.
//

import UIKit

class ViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    private var dataSource: UITableViewDiffableDataSource<Section, Post>!
    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Feed"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "text.bubble"), tag: 0)
    }
    
    //MARK: - Methods
    func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView)
        tableView.register(UITableView.self, forCellReuseIdentifier: "postCell")
        tableView.rowHeight = 280
    }
    
    func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Section, Post>(tableView: tableView) { (tableView, indexPath, item) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "postCell")
            
            var config = cell?.defaultContentConfiguration()
            
            config?.text = item.description
            
            cell?.contentConfiguration = config
            
            return cell
        }
    }

}

