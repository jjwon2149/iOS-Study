//
//  ViewController.swift
//  List in codebase UIKit
//
//  Created by 정종원 on 5/22/24.
//

import UIKit

struct Animal {
    let name: String
}

struct AnimalCategory {
    let category: String
    let animals: [Animal]
}

class ViewController: UIViewController, UITableViewDataSource {

    let items = ["고앵이", "멍멍이", "왈왈", "컹컹", "킁킁", "캥캥"]
    let categories = [
        AnimalCategory(category: "포유류", animals: [Animal(name: "고앵이")]),
        AnimalCategory(category: "포유류", animals: [Animal(name: "멍멍이")]),
        AnimalCategory(category: "포유류", animals: [Animal(name: "왈왈")]),
        AnimalCategory(category: "거북이", animals: [Animal(name: "도마뱀")]),
        AnimalCategory(category: "거북이", animals: [Animal(name: "컹컹")]),
        AnimalCategory(category: "거북이", animals: [Animal(name: "킁킁")]),
        AnimalCategory(category: "거북이", animals: [Animal(name: "캥캥")])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories[section].animals.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section].category
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        var config = cell.defaultContentConfiguration()
        config.text = categories[indexPath.section].animals[indexPath.row].name
        cell.contentConfiguration = config
        return cell
    }

}

