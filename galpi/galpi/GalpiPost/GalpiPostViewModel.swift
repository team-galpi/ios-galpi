//
//  GalpiPostViewModel.swift
//  galpi
//
//  Created by Ellen J on 2023/01/31.
//

import Foundation

final class GalpiPostViewModel: ObservableObject {
    @Published var title: String
    @Published var date: String = ""
    @Published var author: String
    @Published var publisher: String
    @Published var quotes: String = ""
    @Published var opinion: String = ""
    
    init(
        title: String = "",
        author: String = "",
        publisher: String = ""
    ) {
        self.title = title
        self.author = author
        self.publisher = publisher
    }
    
    func createGalpi() {
        
    }
}
