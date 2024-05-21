//
//  ViewController.swift
//  Picker in codebase UIkit
//
//  Created by 정종원 on 5/21/24.
//

import UIKit

class ViewController: UIViewController {
 
    let datePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let today = Date()
        var dateComponents = DateComponents()
        dateComponents.year = 1
        let oneYearFromNow = Calendar.current.date(byAdding: dateComponents, to: today)
        
        datePicker.minimumDate = today
        datePicker.maximumDate = oneYearFromNow
        
        datePicker.addAction(UIAction { [weak self] _ in
            print("sender \(String(describing: self?.datePicker.date.formatted()))")
        }, for: .valueChanged)
        
        view.addSubview(datePicker)
        
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}

