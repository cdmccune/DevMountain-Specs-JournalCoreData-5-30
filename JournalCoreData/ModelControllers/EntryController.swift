//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Curt McCune on 5/30/22.
//

import Foundation
import CoreData

class EntryController {
    
    static var shared = EntryController()
    var entries: [Entry] = []
    
   
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value:true)
        return request
    }()
    
    
    //CRUD
    
    func createEntry(title:String, bodyText: String) {
        let entry = Entry(title: title, bodyText: bodyText)
        entries.append(entry)
        CoreDataStack.saveContext()
    }
    
    func requestEntries() {
        let fetchedEntries = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
            entries = fetchedEntries
    }
    
    func updateEntries(entry: Entry, title: String, body: String) {
        entry.title = title
        entry.bodyText = body
        CoreDataStack.saveContext()
    }
    
    
    
}
