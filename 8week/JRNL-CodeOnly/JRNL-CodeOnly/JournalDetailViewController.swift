//
//  JournalDetailViewController.swift
//  JRNL-CodeOnly
//
//  Created by 정종원 on 5/13/24.
//

import UIKit

class JournalDetailViewController: UIViewController {
    
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
        
        navigationItem.title = "Detail"
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
