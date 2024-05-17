//
//  AddJournalViewController.swift
//  JRNL-CodeOnly
//
//  Created by 정종원 on 5/13/24.
//

import UIKit
import CoreLocation

protocol AddJournalControllerDelegate: NSObject, UITextViewDelegate {
    func saveJournalEntry(_ journalEntry: JournalEntry)
}

class AddJournalViewController: UIViewController, CLLocationManagerDelegate, UITextViewDelegate {
    
    weak var delegate: AddJournalControllerDelegate?
    let locationManager = CLLocationManager()
    var locationSwitchIsOn = false {
        didSet {
            updateSaveButtonState()
        }
    }
    var currentLocation: CLLocation?
    let LABEL_VIEW_TAG = 99
    
    private lazy var mainContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 40
        return stackView
    }()
    
    private lazy var ratingView: UIStackView = {
        let stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 252, height: 44))
        stackView.axis = .horizontal
        stackView.backgroundColor = .systemCyan
        return stackView
    }()
    
    private lazy var toggleView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        let switchComponent = UISwitch()
        let labelComponent = UILabel()
        switchComponent.isOn = false
        switchComponent.addTarget(self, action: #selector(valueChanged(sender:)), for: .valueChanged)
        
        labelComponent.text = "SwitchLabel"
        labelComponent.tag = LABEL_VIEW_TAG
        stackView.addArrangedSubview(switchComponent)
        stackView.addArrangedSubview(labelComponent)
        return stackView
    }()
    
    private lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Journal Title"
        textField.addTarget(self, action: #selector(textChanged(textField:)), for: .editingChanged)
        return textField
    }()
    
    private lazy var bodyTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Journal Body"
        textView.delegate = self
        return textView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "face.smiling")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "New Entry"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                            target: self,
                                                            action: #selector(save))
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                           target: self,
                                                           action: #selector(cancle))
        
        mainContainer.addArrangedSubview(ratingView)
        mainContainer.addArrangedSubview(toggleView)
        mainContainer.addArrangedSubview(titleTextField)
        mainContainer.addArrangedSubview(bodyTextView)
        mainContainer.addArrangedSubview(imageView)
        
        view.addSubview(mainContainer)
        
        let safeArea = view.safeAreaLayoutGuide
        mainContainer.translatesAutoresizingMaskIntoConstraints = false
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        toggleView.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        bodyTextView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            mainContainer.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            mainContainer.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            
            ratingView.widthAnchor.constraint(equalToConstant: 252),
            ratingView.heightAnchor.constraint(equalToConstant: 44),
            
            titleTextField.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 8),
            titleTextField.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -8),
            
            bodyTextView.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 8),
            bodyTextView.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -8),
            bodyTextView.heightAnchor.constraint(equalToConstant: 128),
            
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
            
        ])
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
    }
    
    //MARK: - Methods
    
    func updateSaveButtonState() {
        if locationSwitchIsOn {
            guard let title = titleTextField.text, !title.isEmpty,
                  let body = bodyTextView.text, !body.isEmpty,
                  let _ = currentLocation else {
                navigationItem.rightBarButtonItem?.isEnabled = false
                return
            }
            navigationItem.rightBarButtonItem?.isEnabled = true
        } else {
            guard let title = titleTextField.text, !title.isEmpty,
                  let body = bodyTextView.text, !body.isEmpty else {
                navigationItem.rightBarButtonItem?.isEnabled = false
                return
            }
            navigationItem.rightBarButtonItem?.isEnabled = true
        }
    }
    
    @objc func textChanged(textField: UITextField) {
        updateSaveButtonState()
    }
    
    @objc private func cancle() {
        dismiss(animated: true)
    }
    
    @objc private func save() {
        
        guard let title = titleTextField.text, !title.isEmpty, let body = bodyTextView.text, !body.isEmpty else { return }
        
        let lat = currentLocation?.coordinate.latitude
        let lon = currentLocation?.coordinate.longitude
        
        let journalEntry = JournalEntry(
            rating: 3,
            title: title,
            body: body,
            photo: UIImage(systemName: "face.smiling"),
            latitude: lat, longitude: lon)!
        delegate?.saveJournalEntry(journalEntry)
        dismiss(animated: true)
    }
    
    @objc func valueChanged(sender: UISwitch) {
        if sender.isOn {
            if let label: UILabel = toggleView.viewWithTag(LABEL_VIEW_TAG) as? UILabel {
                label.text = "Getting location..."
            }
            locationManager.requestLocation()
        } else {
            currentLocation = nil
            if let label: UILabel = toggleView.viewWithTag(LABEL_VIEW_TAG) as? UILabel {
                label.text = "Get location"
            }
        }
    }
    
    //MARK: - LocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let myCurrentLocation = locations.first {
            currentLocation = myCurrentLocation
            if let label: UILabel = toggleView.viewWithTag(LABEL_VIEW_TAG) as? UILabel {
                label.text = "Done"
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}
