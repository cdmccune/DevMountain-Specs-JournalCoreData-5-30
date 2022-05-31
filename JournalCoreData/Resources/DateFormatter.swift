//
//  DateFormatter.swift
//  JournalCoreData
//
//  Created by Curt McCune on 5/31/22.
//

import Foundation

extension DateFormatter {
    static let entryTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
}
