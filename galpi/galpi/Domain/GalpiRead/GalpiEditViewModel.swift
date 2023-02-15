//
//  GalpiEditViewModel.swift
//  galpi
//
//  Created by Ellen J on 2023/02/14.
//

import Foundation

final class GalpiEditViewModel: ObservableObject, GalpiPostViewModelInterface {
    var galpi: Galpi
    
    init(galpi: Galpi) {
        self.galpi = galpi
    }
    
    func tapDoneButton() {
        
    }
}
