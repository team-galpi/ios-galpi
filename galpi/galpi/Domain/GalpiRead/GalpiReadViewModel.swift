//
//  GalpiReadViewModel.swift
//  galpi
//
//  Created by Ellen J on 2023/02/11.
//

import Foundation

final class GalpiReadViewModel: ObservableObject {
    
    @Published var galpi: Galpi
    @Published var isEditModeViewPresented: Bool = false
    
    init(galpi: Galpi) {
        self.galpi = galpi
    }
    
    func tapEditModeButton() {
        isEditModeViewPresented.toggle()
    }
    
}
