//
//  String+Extensions.swift
//  Directory
//
//  Created by ANSK Vivek on 13/08/23.
//

import Foundation

extension String {
    func getReadableDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let date = formatter.date(from: self) else { return "" }
        // Set Date/Time Style
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        // Convert Date to String
        return formatter.string(from: date)
    }
}
