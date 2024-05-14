//
//  JournalDetailViewController.swift
//  JRNL-CodeOnly
//
//  Created by 정종원 on 5/13/24.
//

import UIKit

class JournalDetailViewController: UITableViewController {
    
    let journalEntry: JournalEntry
    
    init(journalEntry: JournalEntry) {
        self.journalEntry = journalEntry
        super.init(nibName: nil, bundle:nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        navigationItem.title = "Detail"
        // Do any additional setup after loading the view.
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 1: return 60
        case 3: return 150
        case 4: return 316
        case 5: return 316
        default: return 44.5
        }
    }
}
