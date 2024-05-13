//
//  ViewController.swift
//  JRNL-CodeOnly
//
//  Created by 정종원 on 5/13/24.
//

import UIKit

class JournalListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "journalCell")
        
        let global = view.safeAreaLayoutGuide
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: global.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: global.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: global.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: global.bottomAnchor)
        ])
        
        navigationItem.title = "Journal"
        
        //우상단 +버튼
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addJournal))
    }

    //MARK: - TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: "journalCell", for: indexPath)
    }
    
    //MARK: - Methods
    @objc private func addJournal() {
        let addJournalViewController = AddJournalViewController()
        let navController = UINavigationController(rootViewController: addJournalViewController)
        
        present(navController, animated: true)
    }
}

