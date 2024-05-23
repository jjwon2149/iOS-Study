//
//  ViewController.swift
//  List in codebase UIKit
//
//  Created by 정종원 on 5/22/24.
//

import UIKit

struct Animal {
    let name: String
    let image: UIImage
}


class ViewController: UIViewController, UITableViewDataSource {
    
    let animals = [
        Animal(name: "강아지", image: UIImage(systemName: "dog")!),
        Animal(name: "고양이", image: UIImage(systemName: "cat")!),
        Animal(name: "토끼", image: UIImage(systemName: "hare")!)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
    }
    
    //MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = animals[indexPath.row].name
        configuration.image = animals[indexPath.row].image
        cell.contentConfiguration = configuration
        return cell
    }
}
