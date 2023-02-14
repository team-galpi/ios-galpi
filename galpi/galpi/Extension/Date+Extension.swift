//
//  Date+Extension.swift
//  galpi
//
//  Created by Ellen J on 2023/02/14.
//

import Foundation

extension Date {
    func formatDateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter.string(from: self)
    }
}
