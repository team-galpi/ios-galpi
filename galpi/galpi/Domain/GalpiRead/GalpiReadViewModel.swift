//
//  GalpiReadViewModel.swift
//  galpi
//
//  Created by Ellen J on 2023/02/11.
//

import Foundation

final class GalpiReadViewModel: ObservableObject {
    
    var action: Action
    var state: State
    
    class Action {
        
        weak var state: State?
        
        func tapEditModeButton() {
            state?.isEditModeViewPresented.toggle()
        }
        
        init(output: State) {
            self.state = output
        }
    }
    
    class State {
        @Published var galpi: Galpi
        @Published var isEditModeViewPresented: Bool = false
        @Published var isDismiss: Bool = false
        
        init(galpi: Galpi) {
            self.galpi = galpi
        }
    }

    init(galpi: Galpi) {
        self.state = State(galpi: galpi)
        self.action = Action(output: self.state)
    }
    
}
