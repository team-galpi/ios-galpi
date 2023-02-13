//
//  GalpiPostViewModel.swift
//  galpi
//
//  Created by Ellen J on 2023/01/31.
//

import Foundation

final class GalpiPostViewModel: ObservableObject {
    
    @Published var galpi: Galpi
    
    init(
        galpi: Galpi = Galpi()
    ) {
        self.galpi = galpi
    }
    
    func createGalpi() {
        
    }
    
}
