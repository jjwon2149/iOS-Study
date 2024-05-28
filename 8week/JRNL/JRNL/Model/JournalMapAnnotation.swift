//
//  JournalMapAnnotation.swift
//  JRNL
//
//  Created by 정종원 on 5/28/24.
//

import Foundation
import MapKit

//proxy model
class JournalMapAnnotation: NSObject, MKAnnotation {
    
    let dateString: String
    let entryTitle: String
    let latitude: Double
    let longitude: Double
    let journal: JournalEntry //관계형DB
    
    init(
         journal: JournalEntry
    ) {
        self.dateString = journal.dateString
        self.entryTitle = journal.entryTitle
        self.latitude = journal.latitude ?? 0
        self.longitude = journal.longitude ?? 0
        self.journal = journal
    }
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var title: String? {
        dateString
    }
    
    var subtitle: String? {
        entryTitle
    }
}
