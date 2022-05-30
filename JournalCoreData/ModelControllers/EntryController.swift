//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Curt McCune on 5/30/22.
//

import Foundation

class EntryController {
    
    static var shared = EntryController()
    var entries: [Entry] = []
    
    func createEntry(title:String, bodyText: String) {
        Entry(title: title, bodyText: bodyText)
        CoreDataStack.saveContext()
    }
    
}
