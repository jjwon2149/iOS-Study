//
//  ViewController.swift
//  List in codebase UIKit
//
//  Created by 정종원 on 5/22/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let items = ["고앵이", "멍멍이", "왈왈", "컹컹", "킁킁", "캥캥"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        var config = cell.defaultContentConfiguration()
        config.text = items[indexPath.row]
        cell.contentConfiguration = config
        return cell
    }

}

