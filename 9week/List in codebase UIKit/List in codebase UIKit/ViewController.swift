//
//  ViewController.swift
//  List in codebase UIKit
//
//  Created by 정종원 on 5/22/24.
//

import UIKit

class CustomCell: UITableViewCell {
    let animalImageView = UIImageView()
    let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        animalImageView.contentMode = .scaleAspectFit
        
        animalImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(animalImageView)
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            animalImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            animalImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            animalImageView.widthAnchor.constraint(equalToConstant: 50),
            animalImageView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.leadingAnchor.constraint(equalTo: animalImageView.trailingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

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
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
    }
    
    //MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! CustomCell
        //        var configuration = cell.defaultContentConfiguration()
        //        configuration.text = animals[indexPath.row].name
        //        configuration.image = animals[indexPath.row].image
        //        cell.contentConfiguration = configuration
        cell.animalImageView.image = animals[indexPath.row].image
        cell.nameLabel.text = animals[indexPath.row].name
        return cell
    }
}
