//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by Curt McCune on 5/30/22.
//

import Foundation
import CoreData

extension Entry {
    convenience init (title: String, bodyText: String, timestamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.bodyText = bodyText
        self.timestamp = timestamp
    }
    
}
