//
//  ViewController.swift
//  Custom DatePicker in codebase UIKit
//
//  Created by 정종원 on 5/22/24.
//

//DatePicker를 Picker Custom해서생성

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
    private lazy var datePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    
    let years = [Int](2024...2050)
    let months = [Int](1...12)
    let days = [Int](1...31)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(datePicker)
        
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    //MARK: - UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0: //year
            return years.count
        case 1: //month
            return months.count
        case 2: //day
            return days.count
        default:
            return 0
        }
    }
    
    //MARK: - UIPickerViewDelegate Methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0: //year
            return years[row].description
        case 1: //month
            return months[row].description
        case 2: //day
            return days[row].description
        default:
            return nil
        }
    }

}

