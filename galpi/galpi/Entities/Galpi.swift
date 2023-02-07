//
//  Galpi.swift
//  galpi
//
//  Created by minsson on 2023/02/01.
//

import Foundation

struct Galpi: Hashable {
        
    init(
        title: String = "",
        image: String = "",
        date: Date = Date.now,
        author: String = "",
        publisher: String = "",
        quotes: String = "",
        opinion: String = ""
    ) {
        self.title = title
        self.image = image
        self.date = date
        self.author = author
        self.publisher = publisher
        self.quotes = quotes
        self.opinion = opinion
    }
    
    var title: String
    var image: String
    var date: Date
    var author: String
    var publisher: String
    var quotes: String
    var opinion: String
    
}
