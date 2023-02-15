//
//  GalpiPostViewModel.swift
//  galpi
//
//  Created by Ellen J on 2023/01/31.
//

import Foundation

protocol GalpiPoseViewActionDelegate: AnyObject {
    func tapDoneButton()
}

final class GalpiPostViewModel: ObservableObject {
   
    var action: GalpiPostViewAction
    var state: GalpiPostViewState
    
    class GalpiPostViewAction {
        
        weak var state: GalpiPostViewState?
        weak var actionDelegate: GalpiPoseViewActionDelegate?

        init(state: GalpiPostViewState) {
            self.state = state
        }
        
        func tapDoneButton() {
            actionDelegate?.tapDoneButton()
        }
        
    }
    
    class GalpiPostViewState {
        
        @Published var galpi: Galpi
        
        init(galpi: Galpi) {
            self.galpi = galpi
        }
    }

    
    init(
        galpi: Galpi = Galpi()
    ) {
        self.state = GalpiPostViewState(galpi: galpi)
        self.action = GalpiPostViewAction(state: state)
    }

    private func createGalpi() {
        
    }
}

extension GalpiPostViewModel: GalpiPoseViewActionDelegate {
    func tapDoneButton() {
        
    }
}
