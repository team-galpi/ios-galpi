//
//  GalpiReadViewModel.swift
//  galpi
//
//  Created by Ellen J on 2023/02/11.
//

import Foundation

protocol GalpiReadViewModelInputInterface: AnyObject {
    
    func tapDismissButton()
    func tapEditModeButton()
    
}

protocol GalpiReadViewModelOutputInterface: AnyObject {
    
    var galpi: Galpi { get }

}

protocol GalpiReadViewModelInterface: AnyObject {
    
    var input: GalpiReadViewModelInputInterface { get }
    var output: GalpiReadViewModelOutputInterface { get }
    
}

final class GalpiReadViewModel: ObservableObject, GalpiReadViewModelInterface, GalpiReadViewModelOutputInterface {
    
    var input: GalpiReadViewModelInputInterface { self }
    var output: GalpiReadViewModelOutputInterface { self }
    
    @Published var galpi: Galpi = dummyGalpis[0]
    @Published var isEditModeViewPresented: Bool = false
    @Published var isDismiss: Bool = false
    
}

extension GalpiReadViewModel: GalpiReadViewModelInputInterface {
    
    func tapDismissButton() {
        isDismiss.toggle()
    }
    
    func tapEditModeButton() {
        isEditModeViewPresented.toggle()
    }
    
}
