//
//  SharedData.swift
//  JRNL
//
//  Created by 정종원 on 5/16/24.
//

import Foundation

class SharedData {
    static let shared = SharedData()
    private var journalEntries: [JournalEntry]
    
    private init() {
        self.journalEntries = []
    }
    
    func numberOfJournalEntries() -> Int {
           journalEntries.count
   }
    
    func getJournalEntry(index: Int) -> JournalEntry {
        journalEntries[index]
    }
    
    //사본 전달 함수
    func getAllJournalEntries() -> [JournalEntry] {
        let readOnlyJournalEntries = journalEntries
        return readOnlyJournalEntries
    }
    
    func addJournalEntry(newJournalEntries: JournalEntry) {
        journalEntries.append(newJournalEntries)
    }
    
    func removeJournalEntry(index: Int) {
        journalEntries.remove(at: index)
    }
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func loadJournalEntiriesData() {
        let pathDirectory = getDocumentDirectory()
        let fileURL = pathDirectory.appendingPathComponent("journalEntriesData.json")
        do {
            let data = try Data(contentsOf: fileURL)
            let journalEntries = try JSONDecoder().decode([JournalEntry].self, from: data)
        } catch {
            print("Failed to read JSON data: \(error.localizedDescription)")
        }
    }
}
